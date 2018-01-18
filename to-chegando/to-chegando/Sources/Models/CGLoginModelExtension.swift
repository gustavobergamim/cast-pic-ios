//
//  CGLoginModelExtension.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;

extension CGLoginModel
{
    
    convenience init?(_ json: [String: Any])
    {
        guard let isValido = json["isValido"] as? Bool
        else
        {
            return nil;
        }
        self.init();
        self.isValido = isValido;
    }
}
