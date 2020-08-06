//
//  ViewController.swift
//  Corona Now
//
//  Created by Miguel Moya on 8/4/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalCasesCard: UIView!
    @IBOutlet weak var recoveredCard: UIView!
    @IBOutlet weak var testedCard: UIView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var totalCasesNumberLabel: UILabel!
    @IBOutlet weak var recoveredCasesNumberLabel: UILabel!
    @IBOutlet weak var testedCasesNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchTextField.delegate = self
        
        
        totalCasesCard.layer.cornerRadius = 8
        recoveredCard.layer.cornerRadius = 8
        testedCard.layer.cornerRadius = 8
        
    }
    
    
}

//MARK: - UITextFieldDelegate Extension
extension ViewController: UITextFieldDelegate {
    // Method gets triggered when the user presses "Go"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Force the keyboard to dissapear so that
        // textFieldDidEndEditing() triggers
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let country = textField.text {
            // If there is input in the text field, then.
            print("User typed: \(country)")
        }
        
        // Set the text field input to be blank
        searchTextField.text = ""
    }
}


