//
//  LivroTableViewCell.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class LivroTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemCapa: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var botaoAdicionar: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var livroModel: LivroModel?
    var controller: UIViewController?
    var delegate: LivroTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadingIndicator.stopAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func adicionar(_ sender: UIButton) {
        if (self.livroModel!.jaAdicionado) {
            Alerta.exibir(erro: "Livro já adicionado!", noController: self.controller!)
            return
        }
        self.delegate?.adicionar(cell: self)
    }
    
    func preencher(_ model: LivroModel) {
        self.livroModel = model
        self.labelTitulo.text = model.titulo
        self.labelPreco.text = String(format:"%.2f", model.preco)
        self.carregarImagem(daUrl: model.urlImagem)
    }
    
    func preencher(_ livro: Livro) {
        self.labelTitulo.text = livro.titulo
        self.labelPreco.text = String(format:"%.2f", livro.preco)
        self.carregarImagem(daUrl: livro.urlImagem!)
    }
    
    func carregarImagem(daUrl urlImagem: String) {
        let url:URL = URL(string: urlImagem)!
        DispatchQueue.global(qos: .userInitiated).async {
            let data:NSData = NSData(contentsOf: url)!
            DispatchQueue.main.async {
                let imagem = UIImage(data: data as Data)
                self.imagemCapa.image = imagem
            }
        }
    }
}
