//
//  CustomerInfoScreen.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 08/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

class CustomerInfoScreen
{
    let viewController: UIViewController!
    
    typealias View = CustomerInfoScreenViewController
    typealias Presenter = CustomerInfoScreenPresenter
    typealias Router = CustomerInfoScreenRouter
    
    init() throws
    {
        let viewController = try Consts.Storyboards.main.instantiateViewController(View.self)
        let presenter = Presenter()
        let router = Router()
        
        presenter.view = viewController
        presenter.router = router
        
        viewController.output = presenter
        router.view = viewController
        
        self.viewController = viewController
    }
}
