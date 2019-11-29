//
//  MainsScreenRouter.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

protocol MainScreenRouterInput: class
{
    func navigateToPlainTestScreen()
    func navigateToAlertTestScreen()
    func navigateToWindowScreen()
    func navigateToSetupCustomerInfoScreen()
}

// MARK: - MainScreenRouter
class MainScreenRouter: MainScreenRouterInput
{
    weak var view: UIViewController!
    
    func navigateToWindowScreen()
    {
        do
        {
            let windowTestModule = try WindowTestModule()
            self.view.navigationController?.pushViewController(windowTestModule.viewController, animated: true)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    func navigateToAlertTestScreen()
    {
        do
        {
            let alertTestModule = try AlertTestModule()
            self.view.navigationController?.pushViewController(alertTestModule.viewController, animated: true)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    func navigateToPlainTestScreen()
    {
        do
        {
            let plainTestModule = try PlainTestModule()
            self.view.navigationController?.pushViewController(plainTestModule.viewController, animated: true)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    func navigateToSetupCustomerInfoScreen()
    {
        do
        {
            let screen = try CustomerInfoScreen()
            self.view.navigationController?.pushViewController(screen.viewController, animated: true)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
