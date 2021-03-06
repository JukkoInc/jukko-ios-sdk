//
//  WindowTestModuleProtocols.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import Foundation

// MARK: - Router

protocol WindowTestRouterInput: class
{
    func navigateToPreviousScreen()
}

// MARK: - Presenter

protocol WindowTestViewOutput: class
{
    func viewIsReady()
    func navigateBack()
}

// MARK: - View

protocol WindowTestViewInput: class
{
    func showMessage(_ message: Message)
}
