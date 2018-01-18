//
//  CGLocalizacaoModelExtension.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 18/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;

extension CGLocalizacaoModel {
    
    convenience init?(_ json: [String: Any])
    {
        guard let numeroTelefoneOrigem = json["numeroTelefoneOrigem"] as? String
            else
        {
            return nil;
        }
        guard let numeroTelefoneDestino = json["numeroTelefoneDestino"] as? String
            else
        {
            return nil;
        }
        guard let latitude = json["latitude"] as? Double
            else
        {
            return nil;
        }
        guard let longitude = json["longitude"] as? Double
            else
        {
            return nil;
        }
        guard let atualizacao = json["atualizacao"] as? String
            else
        {
            return nil;
        }
        self.init(numeroTelefoneOrigem, numeroTelefoneDestino, latitude, longitude, Date(fromString: atualizacao)!);
    }
    
    func toJson() -> Data
    {
        var array: [String: Any] = [:];
        array["numeroTelefoneOrigem"] = self.telefoneOrigem;
        array["numeroTelefoneDestino"] = self.telefoneDestino;
        array["latitude"] = self.latitude;
        array["longitude"] = self.longitude;
        array["atualizacao"] = self.atualizacao.toString();
        do
        {
            return try JSONSerialization.data(withJSONObject: array, options: []);
        } catch {
            fatalError("Ocorreu um erro ao serializar o objeto para JSON.");
        }
    }
}
