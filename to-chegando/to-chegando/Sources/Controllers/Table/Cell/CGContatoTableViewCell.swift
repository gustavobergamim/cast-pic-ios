//
//  CGContatoTableViewCell.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGContatoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagem: UIImageView!;
    @IBOutlet weak var labelNome: UILabel!;
    @IBOutlet weak var labelTelefone: UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func preencher(_ contato: CGContatoModel, _ indice: Int)
    {
        self.imagem.image = contato.imagem;
        self.labelNome.text = contato.nome;
        self.labelTelefone.text = contato.telefone;
        self.definirCores(indice);
    }
    
    private func definirCores(_ indice: Int)
    {
        let isPar = indice % 2 == 0;
        self.contentView.backgroundColor = isPar ? CGConstantes.colorAqua : CGConstantes.colorOcean;
        self.labelTelefone.textColor = isPar ? CGConstantes.colorOcean : CGConstantes.colorAqua;
    }
}
