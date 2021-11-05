//
//  Extensions.swift
//  FacebookFriends
//
//  Created by macbook on 3.11.2021.
//

import UIKit

extension UITextField{
    
    func setBottomLine(borderColor: UIColor)
    {
        self.borderStyle = BorderStyle.none
        let borderLine = CALayer()
        borderLine.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.size.width, height: 1)
        borderLine.borderColor = borderColor.cgColor
        borderLine.borderWidth = 1.0
        self.layer.addSublayer(borderLine)
        self.layer.masksToBounds = true
    }
    
}
