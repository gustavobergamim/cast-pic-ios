//
//  CGLoginTextField.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 14/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

@IBDesignable
class CGLoginTextField: UITextField {

    @IBInspectable var borderColor: UIColor? = UIColor.white;
    @IBInspectable var borderWidth : CGFloat = 2.0;
    
    override func draw(_ rect: CGRect) {
        criarBorda(frame: CGRect(x: 0.0, y: rect.size.height - self.borderWidth, width: rect.size.width, height: rect.size.height));
        criarBorda(frame: CGRect(x: 0.0, y: 0.0, width: self.borderWidth, height: rect.size.height));
        self.layer.masksToBounds = true;
    }
    
    func criarBorda(frame : CGRect)
    {
        let borderLayer = CALayer();
        borderLayer.borderColor = self.borderColor?.cgColor;
        borderLayer.frame = frame;
        borderLayer.borderWidth = self.borderWidth;
        self.layer.addSublayer(borderLayer);
    }

}
