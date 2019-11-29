//
//  WindowTestViewController.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

class WindowTestViewController: BaseViewController, WindowTestViewInput
{
    var output: WindowTestViewOutput!
    
    fileprivate var customWindow: UIWindow?
    
    // MARK: Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.showCustomWindow()
        self.output.viewIsReady()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.customWindow = nil
        super.viewWillDisappear(animated)
    }
    
    func showCustomWindow()
    {
        let origin = CGPoint(x: 0, y: self.view.frame.maxY - 150.0)
        let size = CGSize(width: self.view.frame.width, height: 150.0)
        let window = UIWindow(frame: CGRect.init(origin: origin, size: size))
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        window.rootViewController = viewController
        
        let topWindow = UIApplication.shared.windows.last
        window.windowLevel = (topWindow?.windowLevel ?? UIWindow.Level(rawValue: UIWindow.Level.RawValue(-1))) + 1
        window.makeKeyAndVisible()
        self.customWindow = window
    }
}

// MARK: - WindowTestViewInput

extension WindowTestViewController
{
    func showMessage(_ message: Message)
    {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .default){ [weak self] _ in
            self?.output.navigateBack()
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
