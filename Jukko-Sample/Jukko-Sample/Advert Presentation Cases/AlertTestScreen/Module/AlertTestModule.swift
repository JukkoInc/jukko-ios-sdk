//
//  AlertTestModule.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class AlertTestModule
{
    let viewController: UIViewController!
    
    init() throws
    {
        let viewController = try Consts.Storyboards.main.instantiateViewController(AlertTestViewController.self)
        
        let router = AlertTestRouter()
        router.view = viewController
        
        let presenter = AlertTestPresenter()
        presenter.view = viewController
        presenter.router = router
        viewController.output = presenter
        
        self.viewController = viewController
    }
}
