//
//  AlertTestProtocols.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

// MARK: - Router

protocol AlertTestRouterInput: class
{
    func navigateToPreviousScreen()
}

// MARK: - Presenter

protocol AlertTestViewOutput: class
{
    func viewIsReady()
    func navigateBack()
    func preAdvertAlertIsShown()
}

// MARK: - View

protocol AlertTestViewInput: class
{
    func showPreAdvertAlert(_ message: Message)
    func showMessage(_ message: Message)
    func updateShowAdResult(_ text: String)
}
