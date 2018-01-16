//
//  CGPessoa.swift
//  swift-lista-pessoas
//
//  Created by Gustavo Bergamim on 12/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGPessoa: NSObject {
    private (set) var nome: String;
    private (set) var idade: Int;
    private (set) var peso: Double;
    
    init(_ nome: String, _ idade: Int, _ peso: Double = 0) {
        self.nome = nome;
        self.idade = idade;
        self.peso = peso;
    }
}
