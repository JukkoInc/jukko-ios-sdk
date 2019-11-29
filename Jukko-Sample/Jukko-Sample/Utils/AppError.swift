//
//  AppErrors.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

enum AppError: Error
{
    case inconsistencyState(message: String)
    
    var localizedDescription: String
    {
        switch self
        {
        case .inconsistencyState(message: let message):
            return message
        }
    }
}
