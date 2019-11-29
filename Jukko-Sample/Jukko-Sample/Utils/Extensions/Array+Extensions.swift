//
//  Array+Extensions.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 09/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation

extension Array
{
    func item(at index: Int) -> Element?
    {
        guard (0..<self.count).contains(index) else
        {
            return nil
        }
        
        return self[index]
    }
}
