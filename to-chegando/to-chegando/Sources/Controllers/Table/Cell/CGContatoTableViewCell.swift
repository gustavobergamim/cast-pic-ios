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
    
    private let colorAqua = UIColor(red: 0.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1.0);
    private let colorOcean = UIColor(red: 0.0, green: 84.0/255.0, blue: 147.0/255.0, alpha: 1.0);
    
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
        self.contentView.backgroundColor = isPar ? self.colorAqua : self.colorOcean;
        self.labelTelefone.textColor = isPar ? self.colorOcean : self.colorAqua;
    }
}
