//
//  CustomerInfoSetupRouter.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 08/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

protocol CustomerInfoScreenRouterInput: class
{
    func goBack()
}

// MARK: - CustomerInfoSetupRouter
class CustomerInfoScreenRouter: CustomerInfoScreenRouterInput
{
    weak var view: UIViewController!
}

// MARK: - CustomerInfoScreenRouterInput
extension CustomerInfoScreenRouter
{
    func goBack()
    {
        self.view.navigationController?.popViewController(animated: true)
    }
}
