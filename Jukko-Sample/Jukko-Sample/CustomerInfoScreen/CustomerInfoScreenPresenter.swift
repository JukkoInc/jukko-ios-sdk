//
//  CustomerInfoSetupPresenter.swift
//  Jukko-Sample
//
//  Created by Anastasia Tarasova on 08/04/2019.
//  Copyright © 2019 Jukko. All rights reserved.
//

import Foundation
import JukkoSdk

class CustomerInfoScreenPresenter: CustomerInfoScreenViewOutput
{
    weak var view: CustomerInfoScreenViewInput!
    var router: CustomerInfoScreenRouterInput!
    
    lazy var age: Age = {
        self.ageCases.first ?? .none
    }()
    lazy var gender: Gender = {
        self.genderCases.first ?? .none
    }()
    
    let ageCases = Age.allCases
    let genderCases = Gender.allCases
}

// MARK: - CustomerInfoScreenViewOutput
extension CustomerInfoScreenPresenter
{
    func ageVariants() -> [String]
    {
        return ageCases.map{ $0.stringValue }
    }
    
    func selectedAgeIndex() -> Int
    {
        return ageCases.firstIndex(where: { item -> Bool in
            item.stringValue == age.stringValue
        }) ?? 0
    }
    
    func didSelectAge(at index: Int) {
        guard 0..<ageCases.count ~= index else
        {
            return
        }
        
        let age = ageCases[index]
        self.age = age
    }
    
    func genderVariants() -> [String] {
        return genderCases.map{ $0.stringValue }
    }
    
    func selectedGenderIndex() -> Int {
        return genderCases.firstIndex(where: { item -> Bool in
            item.stringValue == age.stringValue
        }) ?? 0
    }
    
    func didSelectGender(at index: Int) {
        guard 0..<genderCases.count ~= index else
        {
            return
        }
        
        let gender = genderCases[index]
        self.gender = gender
    }
    
    func didPressSetUserInfo()
    {
        self.setUserInfo()
    }
}

// MARK: - Logic
extension CustomerInfoScreenPresenter
{
    func setUserInfo()
    {
        self.view.showProgressHUD()
        self.view.hideRequestResult()
        JukkoSdk.shared.setUserInfo(age: age, gender: gender) { [weak self] result in
            self?.view.showRequestResult(success: result.isSuccess)
            self?.view.hideProgressHUD()
        }
    }
}
