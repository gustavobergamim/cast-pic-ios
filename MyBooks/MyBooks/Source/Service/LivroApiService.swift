//
//  LivroApiService.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class LivroApiService {
    
    private let apiUrl : String
    private let requestHeaders = [
        "Content-Type": "application/json",
        "Cache-Control": "no-cache"
    ]
    
    init() {
        apiUrl = "https://api.myjson.com/bins/lim0p";
    }
    
    private func criarUrlRequest() -> NSMutableURLRequest {
        let url  = NSURL(string: self.apiUrl)! as URL
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = self.requestHeaders
        return request
    }
    
    func listarLivros(_ sucesso: @escaping ([LivroModel]?) -> Void, _ falha : @escaping (String) -> Void) {
        let request = self.criarUrlRequest()
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    let livros = LivroModel.parseJsonArray(json!)
                    sucesso(livros);
                    return;
                }
            }
            fatalError("Ocorreu um erro: \(error?.localizedDescription ?? "ERRO")")
        })
        
        dataTask.resume()
    }
    
}
