//
//  CGContatoModelExtension.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit
import CoreData;

extension CGContatoModel
{
    convenience init(fromCoreData entity: Contato)
    {
        self.init();
        self.identificador = entity.objectID;
        self.nome = entity.nome!;
        self.telefone = entity.numeroTelefone!;
        if let imagem = entity.imagem
        {
            self.imagem = UIImage(data: imagem)!;
        }
    }
    
    func atribuirValores(_ contato: Contato)
    {
        contato.nome = self.nome;
        contato.numeroTelefone = self.telefone;
        contato.imagem = UIImagePNGRepresentation(self.imagem);
    }
}
