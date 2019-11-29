//
//  WindowTestRouter.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class WindowTestRouter: WindowTestRouterInput
{
    weak var view: UIViewController!
    
    func navigateToPreviousScreen()
    {
        self.view.navigationController?.popViewController(animated: true)
    }
}
