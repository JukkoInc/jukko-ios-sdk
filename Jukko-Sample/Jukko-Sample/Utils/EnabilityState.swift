//
//  ButtonState.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

enum EnabilityState
{
    case enabled
    case disabled
    
    var localized: String
    {
        switch self
        {
        case .enabled:
            return "Enabled".localized()
    
        default:
            return "Disabled".localized()
        }
    }
}
