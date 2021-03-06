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
    @IBOutlet weak var countryLabel: UILabel!
    
    var countryManager = CountryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        countryManager.delegate = self
        
        totalCasesCard.layer.cornerRadius = 8
        recoveredCard.layer.cornerRadius = 8
        testedCard.layer.cornerRadius = 8
        
        self.hideKeyboardWhenTappedAround()
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
            
            countryManager.fetchCountry(countryName: country)
        }
        
        // Set the text field input to be blank
        searchTextField.text = ""
    }
}

extension ViewController: CountryManagerDelegate {
    func didGetCountry(_ countryManager: CountryManager, country: CountryModel) {
        countryLabel.text = country.country
        totalCasesNumberLabel.text = String(country.cases)
        recoveredCasesNumberLabel.text = String(country.recovered)
        testedCasesNumberLabel.text = String(country.tests)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

