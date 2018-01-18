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
    private let apiUrl : URL;
    private let requestHeaders = [
        "Content-Type": "application/json",
        "Cache-Control": "no-cache"
    ];
    
    init()
    {
        self.apiUrl = NSURL(string: self.config.urlApi)! as URL;
    }
    
    private func criarUrlRequest(method: String = "GET") -> NSMutableURLRequest
    {
        let request = NSMutableURLRequest(url: self.apiUrl,
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
        
        dataTask.resume()
    }
}
