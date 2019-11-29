//
//  WindowTestModule.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class WindowTestModule
{
    let viewController: UIViewController!
    
    init() throws
    {
        let viewController = try Consts.Storyboards.main.instantiateViewController(WindowTestViewController.self)
        
        let presenter = WindowTestPresenter()
        let router = WindowTestRouter()
        
        presenter.view = viewController
        router.view = viewController
        presenter.router = router
        
        viewController.output = presenter
        
        self.viewController = viewController
    }
}
