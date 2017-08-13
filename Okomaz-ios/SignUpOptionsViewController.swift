//
//  SignUpOptionsViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import MRCountryPicker

class SignUpOptionsViewController: UIViewController, MRCountryPickerDelegate {
    var selectedAccountOption: String!
    
    @IBOutlet weak var selectedCountry: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryPicker: MRCountryPicker!
    var dialCode: String!
    var countryName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        countryPicker.countryPickerDelegate = self
        countryPicker.showPhoneNumbers = true
        countryPicker.setCountry("TZ")


    }

 
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    

    @IBAction func registerAccountMain(_ sender: Any) {
        self.selectedAccountOption = "Main Household Contact"
        self.performSegue(withIdentifier: "navToSignUp", sender: nil)
    }
   
    @IBAction func registerAccountMember(_ sender: Any) {
        self.selectedAccountOption = "Member Household Contact"
        self.performSegue(withIdentifier: "navToSignUp", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let signUpVC =  segue.destination as! SignUpViewController
        print (selectedAccountOption)
        signUpVC.title = "Sign Up"
        signUpVC.selectedOption = selectedAccountOption
        signUpVC.countryName = countryName
        signUpVC.dialCode = dialCode
        
    }
    
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.selectedCountry.text = name
        self.countryImage.image = flag
        countryName = name
        dialCode = phoneCode
    }

}
