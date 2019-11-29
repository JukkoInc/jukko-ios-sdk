//
//  UIColor+Palette.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 09/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    static var success: UIColor
    {
        return UIColor(hex: 0x03b500, alpha: 1.0)
    }
    
    static var failure: UIColor
    {
        return UIColor(hex: 0xc90003, alpha: 1.0)
    }
}

extension UIColor
{
    convenience init(hex: UInt32, alpha: CGFloat)
    {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
