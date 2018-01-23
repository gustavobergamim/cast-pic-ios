//
//  Alerta.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class Alerta {
    
    static func exibir(erro: String, noController controller: UIViewController)
    {
        self.exibir(mensagem: erro, comTitulo: "Ocorreu um erro!", noController: controller)
    }
    
    static func exibir(mensagem:String, noController controller: UIViewController)
    {
        self.exibir(mensagem: mensagem, comTitulo: "Meus Livros", noController: controller)
    }
    
    static func exibir(mensagem:String, comTitulo titulo: String, noController controller: UIViewController)
    {
        let alertController: UIAlertController
        alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        controller.present(alertController, animated: true, completion: nil)
    }
}
