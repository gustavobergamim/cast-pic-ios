//
//  ConsultaLivroService.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class ConsultaLivroService {
    
    func pesquisar(comTitulo titulo: String, _ controller: UIViewController, dataCallback: @escaping ([LivroModel]) -> Void, completeCallback: @escaping () -> Void) {
        let apiService = LivroApiService()
        
        apiService.listarLivros({ (livros) in
            var livrosPesquisa = livros?.filter({ (livro) -> Bool in
                return titulo.count == 0 || livro.titulo.lowercased().contains(titulo.lowercased())
            }) ?? []
            self.verificarJaAdicionados(livrosPesquisa)
            livrosPesquisa = livrosPesquisa.sorted(by: { (livroA, livroB) -> Bool in
                return livroA.titulo < livroB.titulo
            })
            dataCallback(livrosPesquisa)
            completeCallback()
        }) { (mensagem) in
            Alerta.exibir(erro: mensagem, noController: controller)
            completeCallback()
        }
    }
    
    func verificarJaAdicionados(_ livrosApi: [LivroModel]) {
        if (livrosApi.count == 0) {
            return
        }
        let dataContext = DataContext()
        let livrosSalvos: [Livro] = dataContext.fetch()
        if (livrosSalvos.count == 0) {
            return
        }
        livrosApi.forEach({ (livroModel) in
            let jaAdicionados = livrosSalvos.filter({ (livro) -> Bool in
                return livroModel.ISBN == livro.isbn
            })
            livroModel.jaAdicionado = jaAdicionados.count > 0
        })
    }

}
