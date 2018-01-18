//
//  DateExtension.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 18/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;

extension Date
{
    init?(fromString dateString: String)
    {
        self = Date.getFormatter().date(from: dateString)!;
    }
    
    func toString() -> String
    {
        return Date.getFormatter().string(from: self);
    }
    
    static func getFormatter() -> DateFormatter
    {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss";
        return dateFormatter;
    }
}
