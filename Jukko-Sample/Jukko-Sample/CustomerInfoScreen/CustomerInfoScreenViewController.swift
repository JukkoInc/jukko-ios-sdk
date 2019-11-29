//
//  CustomerInfoSetupViewController.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 08/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import UIKit

protocol CustomerInfoScreenViewInput: class
{
    func showProgressHUD()
    func hideProgressHUD()
    
    func hideRequestResult()
    func showRequestResult(success: Bool)
}

protocol CustomerInfoScreenViewOutput: class
{
    func ageVariants() -> [String]
    func selectedAgeIndex() -> Int
    func didSelectAge(at index: Int)
    
    func genderVariants() -> [String]
    func selectedGenderIndex() -> Int
    func didSelectGender(at index: Int)
    
    func didPressSetUserInfo()
}

// MARK: - CustomerInfoScreenViewController
class CustomerInfoScreenViewController: UIViewController, DescriptionProtocol, CustomerInfoScreenViewInput, UIPickerViewDelegate, UIPickerViewDataSource
{
    var output: CustomerInfoScreenViewOutput!
    
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    @IBOutlet weak var setInfoButton: UIButton!
    @IBOutlet weak var requestResultLabel: UILabel!
    
    var progressHUD = ProgressView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupViews()
        self.title = "Set User Info"
    }
    
    // MARK: - Setup
    func setupViews()
    {
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        
        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        self.requestResultLabel.isHidden = true
    }
    
    // MARK: Actions
    
    @IBAction func setInfoButtonPressed(_ sender: Any)
    {
        self.output.didPressSetUserInfo()
    }
}

// MARK: - CustomerInfoScreenViewInput
extension CustomerInfoScreenViewController
{
    func showProgressHUD()
    {
        self.progressHUD.show(on: self.view)
    }
    
    func hideProgressHUD()
    {
        self.progressHUD.hide()
    }
    
    func hideRequestResult()
    {
        self.requestResultLabel.isHidden = true
    }
    
    func showRequestResult(success: Bool)
    {
        self.requestResultLabel.isHidden = false
        switch success
        {
        case true:
            self.requestResultLabel.textColor = .success
        default:
            self.requestResultLabel.textColor = .failure
        }
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension CustomerInfoScreenViewController
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        switch pickerView
        {
        case agePicker:
            return self.output.ageVariants().count
        case genderPicker:
            return self.output.genderVariants().count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        switch pickerView
    {
        case agePicker:
            return output.ageVariants().item(at: row)
        case genderPicker:
            return output.genderVariants().item(at: row)
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch pickerView {
        case agePicker:
            self.output.didSelectAge(at: row)
        case genderPicker:
            self.output.didSelectGender(at: row)
        default:
            return
        }
    }
}
