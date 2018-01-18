//
//  CGLoginService.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 14/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import Foundation;

class CGLoginService
{
    
    private let config = CGAppConfig();
    private let apiUrl : URL;
    private let apiUrlTeste : URL;
    private let requestHeaders = ["Cache-Control": "no-cache"];
    
    init()
    {
        self.apiUrl = NSURL(string: self.config.urlApi)! as URL;
        self.apiUrlTeste = NSURL(string: self.config.urlApiTeste)! as URL;
    }
    
    private func criarUrlRequest() -> NSMutableURLRequest
    {
        let request = NSMutableURLRequest(url: self.apiUrlTeste,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0);
        request.httpMethod = "GET";
        request.allHTTPHeaderFields = self.requestHeaders;
        return request;
    }
    
    func validarUsuario(numeroTelefone : String, _ sucesso: @escaping () -> Void, _ falha : @escaping (String) -> Void)
    {
        if (numeroTelefone.count == 0)
        {
            falha("Por favor, informe seu número de telefone.");
            return;
        }
        if (numeroTelefone.starts(with: "11"))
        {
            falha("Este número de telefone não existe.");
            return;
        }
        let urlRequest = self.criarUrlRequest();
        
        let session = URLSession.shared;
        let dataTask = session.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                if let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                {
                    let loginResult = CGLoginModel(json!);
                    if (loginResult!.isValido)
                    {
                        UserDefaults().set(numeroTelefone, forKey: CGConstantes.keyLogin);
                        sucesso();
                        return;
                    }
                }
            }
            falha("Ocorreu um erro ao validar o número de telefone: \(error?.localizedDescription ?? "")");
        });
        
        dataTask.resume()
    }
}
