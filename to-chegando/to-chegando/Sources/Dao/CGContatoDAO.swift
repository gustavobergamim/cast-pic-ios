//
//  CGContatoDAO.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import CoreData;

class CGContatoDAO: NSObject {

    private let context = CGCoreDataContext();
    
    func salvar(_ model: CGContatoModel)
    {
        let contato: Contato;
        if let objectId = model.identificador
        {
            contato = (context.context.object(with: objectId) as? Contato)!;
        }
        else
        {
            contato = Contato(context: context.context);
        }
        model.atribuirValores(contato);
        self.context.salvar();
    }
    
    func listar() -> [CGContatoModel]
    {
        let result = self.context.listar(ordernarPor: #keyPath(Contato.nome)) as [Contato];
        return result.map { (contato: Contato) -> CGContatoModel in
            return CGContatoModel(fromCoreData: contato);
        };
    }
    
    func excluir(_ model: CGContatoModel)
    {
        if let objectId = model.identificador
        {
            self.context.excluir(withId: objectId);
        }
    }
}
