//
//  DescriptionProtocol.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

protocol DescriptionProtocol: NSObjectProtocol
{
    static var storyboardIdentifier: String { get }
}

extension DescriptionProtocol
{
    static var storyboardIdentifier: String
    {
        return String(describing: self)
    }
}
