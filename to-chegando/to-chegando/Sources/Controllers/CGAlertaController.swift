//
//  CGAlertaController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGAlertaController
{
    let alerta: UIAlertController;
    
    init(exibirErro mensagem:String)
    {
        alerta = UIAlertController(title: "Erro!", message: mensagem, preferredStyle: .alert);
        let acao = UIAlertAction(title: "OK", style: .default, handler: nil);
        alerta.addAction(acao);
    }
    
    func exibir(_ controller: UIViewController)
    {
        controller.present(self.alerta, animated: true, completion: nil);
    }
}
