//
//  ProgressView.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 08/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

class ProgressView
{
    private var containerView = UIView()
    private var progressView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    private var removeFromSuperViewOnHide = false
    
    init()
    {
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.style = .whiteLarge
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
    }
    
    func show(on view: UIView)
    {
        containerView.frame = view.frame
        containerView.center = view.center
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = view.center
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)

        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    func hide()
    {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}
