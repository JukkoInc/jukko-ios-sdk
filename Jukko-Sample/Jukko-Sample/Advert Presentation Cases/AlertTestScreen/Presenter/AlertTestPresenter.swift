//
//  AlertTestPresenter.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation
import JukkoSdk

class AlertTestPresenter: AlertTestViewOutput
{
    weak var view: AlertTestViewInput!
    var router: AlertTestRouterInput!
}

// MARK: - AlertTestViewOutput

extension AlertTestPresenter
{
    func viewIsReady()
    {
        let message = Message(title: "Custom Alert", body: "Advert will be shown promtly after alert display")
        self.view.showPreAdvertAlert(message)
    }
    
    func navigateBack()
    {
        self.router.navigateToPreviousScreen()
    }
    
    func preAdvertAlertIsShown()
    {
        JukkoSdk.shared.showAd { [weak self] event -> (Void) in
            print(event?.toString() ?? "nil")
            self?.view.updateShowAdResult(event?.toString() ?? "nil")
        }
    }
}
