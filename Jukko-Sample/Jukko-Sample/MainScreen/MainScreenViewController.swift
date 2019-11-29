//
//  MainScreenViewController.swift
//  Jukko Sample Dev
//
//  Created by Anastasia Tarasova on 21/05/2018.
//  Copyright © 2018 Jukko. All rights reserved.
//

import UIKit

protocol MainScreenViewInput: class
{
    func showMessage(_ message: Message)
    func updateUI()
    
    func showProgressHUD()
    func hideProgressHUD()
}

protocol MainScreenViewOutput: class
{
    // MARK: State
    func viewIsReady()
    
    // MARK: Data
    func isDebugModeEnabled() -> Bool
    func isSdkInitialized() -> Bool
    func jukkoSdkVersion() -> String
    func applicationVersion() -> String
    func frequencyText() -> String
    func environment() -> String
    
    // MARK: Actions
    func debugModeSet(enabled: Bool)
    func setupFrequency(_ text: String)
    
    func initButtonPressed()
    func plainTestButtonPressed()
    func alertTestButtonPressed()
    func windowTestButtonPressed()
    func setupCustomerInfoPressed()
}

// MARK: - MainScreenViewController
class MainScreenViewController: BaseViewController, MainScreenViewInput
{
    var output: MainScreenViewOutput!
    
    @IBOutlet weak var environmentLabel: UILabel!
    @IBOutlet weak var sdkStateLabel: UILabel!
    @IBOutlet weak var sdkVersionLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var setFrequencyButton: UIButton!
    @IBOutlet weak var setupCustomerInfoButton: UIButton!
    @IBOutlet weak var debugModeSwitch: UISwitch!
    
    @IBOutlet weak var showAdButton: UIButton!
    @IBOutlet weak var showAdAboveAlertButton: UIButton!
    @IBOutlet weak var showAdAboveWindowButton: UIButton!
    
    @IBOutlet weak var showAdOptionsStackView: UIStackView!
    @IBOutlet weak var showAdAdditionalButtonsHeight: NSLayoutConstraint!
    
    var progressHUD = ProgressView()
    
    // Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.output.viewIsReady()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillDisappear(animated)
    }
    
    func hideKeyboard()
    {
        self.view.endEditing(true)
    }
    
    func setupViews()
    {
        if !Consts.showAdditionalShowAdOptions
        {
            self.showAdAdditionalButtonsHeight.constant = 0
            self.showAdOptionsStackView.isHidden = true
            self.showAdOptionsStackView.isUserInteractionEnabled = false
            self.view.setNeedsLayout()
        }
        
        self.setupCustomerInfoButton.setBackgroundColor(color: UIColor(hex: 0xc77ee1, alpha: 1.0), forState: .disabled)
        self.environmentLabel.text = self.output.environment()
    }
    
    // MARK: IB Action
    @IBAction func initButtonPressed(_ sender: UIButton)
    {
        self.output.initButtonPressed()
    }
    
    @IBAction func setupFrequencyPressed(_ sender: UIButton)
    {
        guard let text = self.frequencyTextField.text else
        {
            return
        }
        
        self.output.setupFrequency(text)
    }
    
    @IBAction func showAdPressed(_ sender: UIButton)
    {
        self.output.plainTestButtonPressed()
    }
    
    @IBAction func showAdAboveAlertPressed(_ sender: UIButton)
    {
        self.output.alertTestButtonPressed()
    }
    
    @IBAction func showAdAboveWindowPressed(_ sender: UIButton)
    {
        self.output.windowTestButtonPressed()
    }
    
    @IBAction func setupCustomerInfoPressed(_ sender: Any)
    {
        self.output.setupCustomerInfoPressed()
    }
    
    @IBAction func debugModeSwitchToggled(_ sender: UISwitch)
    {
        self.output.debugModeSet(enabled: sender.isOn)
    }
}

// MARK: - MainScreenViewInput

extension MainScreenViewController
{
    func showMessage(_ message: Message)
    {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: .alert)
       
        let okAction = UIAlertAction(title: "Ok".localized(), style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) {
        }
    }
    
    func updateUI()
    {
        self.hideKeyboard()
        
        self.frequencyTextField.text = self.output.frequencyText()
        self.debugModeSwitch.setOn(output.isDebugModeEnabled(), animated: false)
        self.appVersionLabel.text = self.output.applicationVersion()
        self.sdkVersionLabel.text = self.output.jukkoSdkVersion()
        
        if self.output.isSdkInitialized()
        {
            self.sdkStateLabel.text = "Initialized"
            self.sdkStateLabel.textColor = .success
            self.setupCustomerInfoButton.isEnabled = true
        }
        else
        {
            self.sdkStateLabel.text = "Not Initialized"
            self.sdkStateLabel.textColor = .failure
            self.setupCustomerInfoButton.isEnabled = false
        }
    }
    
    func showProgressHUD()
    {
        self.progressHUD.show(on: self.view)
    }
    
    func hideProgressHUD()
    {
        self.progressHUD.hide()
    }
}

extension MainScreenViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.frequencyTextField.resignFirstResponder()
        return true
    }
}
