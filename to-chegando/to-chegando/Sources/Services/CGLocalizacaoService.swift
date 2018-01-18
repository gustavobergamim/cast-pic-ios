//
//  CGLocalizacaoService.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 17/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import Foundation;

class CGLocalizacaoService
{
    private let config = CGAppConfig();
    private let apiUrl : String;
    private let requestHeaders = [
        "Content-Type": "application/json",
        "Cache-Control": "no-cache"
    ];
    
    init()
    {
        self.apiUrl = self.config.urlApi;
    }
    
    private func criarUrlRequest(method: String = "GET", suffix: String = "") -> NSMutableURLRequest
    {
        let url  = NSURL(string: self.apiUrl + suffix) as! URL;
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0);
        request.httpMethod = method;
        request.allHTTPHeaderFields = self.requestHeaders;
        return request;
    }
    
    func salvarLocalizacao(_ localizacao: CGLocalizacaoModel, _ sucesso: @escaping () -> Void, _ falha : @escaping (String) -> Void)
    {
        let request = self.criarUrlRequest(method: "POST");
        request.httpBody = localizacao.toJson();
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                sucesso();
                return;
            }
            falha("Ocorreu um erro ao salvar a localização: \(error?.localizedDescription ?? "")");
        })
        
        dataTask.resume();
    }
    
    func obterLocalizacao(_ numeroTelefoneContato: String, _ sucesso: @escaping (CGLocalizacaoModel?) -> Void, _ falha : @escaping (String) -> Void)
    {
        let numeroTelefoneOrigem = UserDefaults().string(forKey: CGConstantes.keyLogin)!;
        let request = self.criarUrlRequest(method: "GET", suffix: "/\(numeroTelefoneOrigem)/\(numeroTelefoneContato)");
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                {
                    sucesso(CGLocalizacaoModel.init(json!));
                    return;
                }
            }
            falha("Ocorreu um erro ao obter a localização: \(error?.localizedDescription ?? "")");
        })
        
        dataTask.resume()
    }
}
