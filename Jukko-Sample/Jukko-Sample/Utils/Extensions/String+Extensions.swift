//
//  StringExtensions.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

extension String
{
    func localized() -> String
    {
        return Bundle.main.localizedString(forKey: self, value: String(), table: nil)
    }
}
