//
//  AlertTestViewController.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class AlertTestViewController: BaseViewController, AlertTestViewInput
{
    var output: AlertTestViewOutput!
    
    @IBOutlet weak var showAdResultLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.output.viewIsReady()
        self.title = "Above Alert"
    }
}

// MARK: - AlertTestViewInput

extension AlertTestViewController
{
    func showPreAdvertAlert(_ message: Message)
    {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .default, handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true){ [weak self] in
            self?.output.preAdvertAlertIsShown()
        }
    }
    
    func showMessage(_ message: Message)
    {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .default){ [weak self] _ in
            self?.output.navigateBack()
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateShowAdResult(_ text: String)
    {
        self.showAdResultLabel.text = text
    }
}
