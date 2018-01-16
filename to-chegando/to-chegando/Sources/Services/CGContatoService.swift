//
//  CGContatoService.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;

class CGContatoService
{
    let dao: CGContatoDAO = CGContatoDAO();
    
    func salvar(_ contato: CGContatoModel) -> Bool
    {
        if (contato.nome.count == 0
            || contato.telefone.count == 0)
        {
            return false;
        }
        
        self.dao.salvar(contato);
        return true;
    }
    
    func listar() -> [CGContatoModel]
    {
        return self.dao.listar();
    }
    
    func excluir(_ contato: CGContatoModel)
    {
        self.dao.excluir(contato);
    }
}
