//
//  CGAppConfig.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 14/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGAppConfig: NSObject {
    
    var urlApi : String
    {
        get
        {
            return getConfigValue(key: "url_api_teste");
        }
    }
    
    private func getConfigValue(key : String) -> String
    {
        if let configPath = Bundle.main.path(forResource: "config", ofType: "plist")
        {
            if let configDic = NSDictionary(contentsOfFile: configPath) as? [String: String]
            {
                return configDic[key]!;
            }
        }
        return "";
    }
}
