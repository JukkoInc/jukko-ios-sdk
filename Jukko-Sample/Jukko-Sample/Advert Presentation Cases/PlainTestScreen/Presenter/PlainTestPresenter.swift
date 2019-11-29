//
//  PlainTestPresenter.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation
import JukkoSdk

class PlainTestPresenter: PlainTestViewOutput
{
    weak var view: PlainTestViewInput!
    var router: PlainTestRouterInput!
}

// MARK: - PlainTestViewOutput

extension PlainTestPresenter
{
    func viewIsReady()
    {
        JukkoSdk.shared.showAd { [weak self] event -> (Void) in
                print(event?.toString() ?? "nil")
                self?.router.navigateToPreviousScreen()
            }
    }
    
    func navigateBack()
    {
        self.router.navigateToPreviousScreen()
    }
}
