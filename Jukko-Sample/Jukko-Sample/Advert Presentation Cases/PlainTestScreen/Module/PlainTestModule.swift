//
//  PlainTestModule.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

/**
 Screen to test Jukko advert presentation when no alerts or custom windows are presented.
 */
class PlainTestModule
{
    let viewController: UIViewController!
    
    init() throws
    {
        let viewController = try Consts.Storyboards.main.instantiateViewController(PlainTestViewController.self)
        
        let router = PlainTestRouter()
        router.view = viewController
        
        let presenter = PlainTestPresenter()
        presenter.view = viewController
        presenter.router = router
        viewController.output = presenter
        
        self.viewController = viewController
    }
}
