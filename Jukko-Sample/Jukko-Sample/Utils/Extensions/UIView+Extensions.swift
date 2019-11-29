//
//  UIViewExtensions.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 09/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIView
{
    @IBInspectable var cornerRadius: Double
    {
        get
        {
            return Double(self.layer.cornerRadius)
        }
        set
        {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double
    {
        get
        {
            return Double(self.layer.borderWidth)
        }
        set
        {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor?
    {
        get
        {
            if let cgColor = self.layer.borderColor
            {
                return UIColor(cgColor: cgColor)
            }
            else
            {
                return nil
            }
        }
        set
        {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor?
    {
        get
        {
            if let cgColor = self.layer.shadowColor
            {
                return UIColor(cgColor: cgColor)
            }
            else
            {
                return nil
            }
        }
        set
        {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float
    {
        get
        {
            return self.layer.shadowOpacity
        }
        set
        {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize
    {
        get
        {
            return self.layer.shadowOffset
        }
        set
        {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: Double
    {
        get
        {
            return Double(self.layer.shadowRadius)
        }
        set
        {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
}
