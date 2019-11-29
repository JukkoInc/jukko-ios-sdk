//
//  MainScreenPresenter.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation 
import JukkoSdk

class MainScreenPresenter: MainScreenViewOutput
{
    weak var view: MainScreenViewInput!
    var router: MainScreenRouterInput!
}

// MARK: - MainScreenViewOutput

extension MainScreenPresenter
{
    func viewIsReady()
    {
        self.view.updateUI()
    }
    
    // MARK: Data
    
    func isDebugModeEnabled() -> Bool
    {
        return JukkoSdk.shared.debugMode
    }
    
    func isSdkInitialized() -> Bool
    {
        return JukkoSdk.shared.isInitialized
    }
    
    func frequencyText() -> String
    {
        return "\(JukkoSdk.shared.adsFrequency)"
    }
    
    func jukkoSdkVersion() -> String
    {
        return JukkoSdk.shared.version
    }
    
    func applicationVersion() -> String
    {
        guard let dictionary =  Bundle.main.infoDictionary else
        {
            return "unknown"
        }
        let version = dictionary["CFBundleShortVersionString"] as? String ?? "nil"
        let build = dictionary["CFBundleVersion"] as? String ?? "nil"
        return "\(version) (\(build))"
    }
    
    func environment() -> String
    {
        #if Dev
            return "Dev"
        #elseif Staging
            return "Staging"
        #elseif Production
            return "Production"
        #else
            return "Unknown"
        #endif
    }
    
    // MARK: Input
    
    func debugModeSet(enabled: Bool)
    {
         JukkoSdk.shared.debugMode = enabled
    }
    
    func setupFrequency(_ text: String)
    {
        guard let newFrequency = Int(text) else
        {
            print("Not valid frequency. Can't be cast to Integer.")
            return
        }
        
        JukkoSdk.shared.adsFrequency = newFrequency
        self.view.updateUI()
    }
    
    // MARK: Button Actions
    
    func initButtonPressed()
    {
        self.view.showProgressHUD()
        JukkoSdk.shared.initialize(apiKey: Consts.apiKey) { [weak self] result in
            self?.view.updateUI()
            self?.view.hideProgressHUD()
        }
    }
    
    func plainTestButtonPressed()
    {
        JukkoSdk.shared.showAd { event -> (Void) in
            print(event?.toString() ?? "nil")
        }
    }
    
    func alertTestButtonPressed()
    {
        self.router.navigateToAlertTestScreen()
    }
    
    func windowTestButtonPressed()
    {
        self.router.navigateToWindowScreen()
    }
    
    func setupCustomerInfoPressed()
    {
        self.router.navigateToSetupCustomerInfoScreen()
    }
}

// MARK: - Utility
extension MainScreenPresenter
{
    fileprivate func showSdkNotInitializedMessage()
    {
        let message = Message(title: "Jukko SDK State".localized(), body: "Jukko SDK is not initialized. Advert will not be shown.")
        self.view.showMessage(message)
    }
}
