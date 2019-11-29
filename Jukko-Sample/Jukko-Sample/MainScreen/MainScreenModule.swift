//
//  MainModule.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class MainScreenModule
{
    let viewController: UIViewController!
    
    init() throws
    {
        let viewController = try Consts.Storyboards.main.instantiateViewController(MainScreenViewController.self)
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        
        presenter.view = viewController
        presenter.router = router
        
        viewController.output = presenter
        router.view = viewController
        
        self.viewController = viewController
    }
}
