//
//  ViewController.swift
//  textFieldTest
//
//  Created by RYAN ROSELLO on 8/3/17.
//  Copyright © 2017 RYAN ROSELLO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var switchTextField: UITextField!
    @IBOutlet weak var editSwitch: UISwitch!
    
    var zipCodeDelegate = ZipCodeDelegate()
    var cashFieldDelegate = CashFieldDelegate()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeTextField.delegate = zipCodeDelegate
        cashTextField.delegate = cashFieldDelegate
        switchTextField.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if editSwitch.isOn {
            return true
        }
        
        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

