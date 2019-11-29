//
//  WindowTestPresenter.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation
import JukkoSdk

class WindowTestPresenter: WindowTestViewOutput
{
    weak var view: WindowTestViewInput!
    var router: WindowTestRouterInput!
}

extension WindowTestPresenter
{
    func viewIsReady()
    {
        JukkoSdk.shared.showAd { [weak self] event -> (Void) in
                print(event?.toString() ?? "nil")
                let message = Message(title: "Ad Close Event".localized(), body: event?.toString())
                self?.view.showMessage(message)
        }
    }
    
    func navigateBack()
    {
        self.router.navigateToPreviousScreen()
    }
}
