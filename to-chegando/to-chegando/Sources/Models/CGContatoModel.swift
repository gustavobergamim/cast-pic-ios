//
//  CGContatoModel.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import CoreData;

class CGContatoModel {

    var identificador: NSManagedObjectID? = nil;
    var nome: String;
    var telefone: String;
    var imagem: UIImage = UIImage.init(named: "user")!;
    
    init() {
        self.nome = "";
        self.telefone = "";
    }
    
    init(_ nome: String, _ telefone: String) {
        self.nome = nome;
        self.telefone = telefone;
    }
}
