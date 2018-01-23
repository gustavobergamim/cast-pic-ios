//
//  LivroModel.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit
import CoreData

class LivroModel {
    var ISBN: Int32
    var titulo: String
    var preco: Double
    var urlImagem: String
    var jaAdicionado: Bool = false
    
    init(_ ISBN: Int32, _ titulo: String, _ preco: Double, _ urlImagem: String) {
        self.ISBN = ISBN;
        self.titulo = titulo
        self.preco = preco
        self.urlImagem = urlImagem
    }
    
    convenience init?(fromJson json: [String: Any])
    {
        guard let ISBN = json["ISBN"] as? Int32
            else {
                return nil
        }
        
        guard let titulo = json["titulo"] as? String
            else {
                return nil
        }
        
        guard let preco = json["preco"] as? Double
            else {
                return nil
        }
        
        guard let urlImagem = json["imagem"] as? String
            else {
                return nil
        }
        
        self.init(ISBN, titulo, preco, urlImagem)
    }
    
    func criarLivro(context: NSManagedObjectContext) {
        let livro = Livro(context: context)
        livro.isbn = self.ISBN
        livro.titulo = self.titulo
        livro.preco = self.preco
        livro.urlImagem = self.urlImagem
    }
    
    static func parseJsonArray(_ json: [String: Any]) -> [LivroModel] {
        var livros: [LivroModel] = [];
        if let array = json["livros"] as? [Any] {
            for item in array {
                if let livro = LivroModel(fromJson: item as! [String: Any]) {
                    livros.append(livro)
                }
            }
        }
        return livros
    }
}
