//
//  PlainTestViewController.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class PlainTestViewController: BaseViewController, PlainTestViewInput
{
    var output: PlainTestViewOutput!
    
    // MARK: Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.output.viewIsReady()
        self.title = "Show Advert"
    }
}

// MARK: - PlainTestViewInput

extension PlainTestViewController
{
    func showMessage(_ message: Message)
    {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .default) { [weak self] _ in
            self?.output.navigateBack()
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) {
        }
    }
}
