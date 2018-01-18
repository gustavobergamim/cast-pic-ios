//
//  CGLocalizacaoModel.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 18/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;

class CGLocalizacaoModel
{
    private (set) var telefoneOrigem: String;
    private (set) var telefoneDestino: String;
    private (set) var latitude: Double;
    private (set) var longitude: Double;
    private (set) var atualizacao: Date;
    
    init(_ telefoneOrigem: String, _ telefoneDestino: String, _ latitude: Double, _ longitude: Double, _ atualizacao: Date = Date())
    {
        self.telefoneOrigem = telefoneOrigem;
        self.telefoneDestino = telefoneDestino;
        self.latitude = latitude;
        self.longitude = longitude;
        self.atualizacao = atualizacao;
    }
}
