//
//  SignUpViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/10/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import SinchVerification

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var signUpOption: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var verifyPassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var verification: Verification!
    var clientInfo: Client!
    var selectedOption: String?
    var dialCode: String!
    var countryName: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
        configureUI()
    }
    
  

    @IBAction func signUp(_ sender: Any) {
        if !name.hasText || !password.hasText || !verifyPassword.hasText || !phone.hasText {
            self.present(AlertUtil.errorAlert(title: "Could not Register Account", message: "No Field can be empty"), animated: true, completion: nil)
        }
        else if (phone.text?.characters.count)! < 9 || (phone.text?.characters.count)! > 15{
            self.present(AlertUtil.errorAlert(title: "Could not Register Account", message: "Incorrect Phone Number Format"), animated: true, completion: nil)
        }
        else if password.text != verifyPassword.text{
            self.present(AlertUtil.errorAlert(title: "Could not Register Account", message: "Password fields must match"), animated: true, completion: nil)
        }
        else{
            print("Phone number is: " + phone.text!)
            
            verification = SMSVerification(Constants.API.SinchApplicationKey,phoneNumber: phone.text!)
            verification.initiate { (result:InitiationResult, error:Error?) -> Void in
                if (result.success){
                    
                    
                    
                    self.performSegue(withIdentifier: "navToCodeVerification", sender: sender)
                    
                } else {
                    print(error!)
                    self.present(AlertUtil.errorAlert(title: "Could Not Send Verification Code", message: "Try to check your phone number and internet connection"), animated: true, completion: nil)
                }
            }

        }
        
    }
    func configureClientInfo(){
        self.clientInfo = Client(name: self.name.text!, phoneNumber: self.phone.text!, password: self.password.text!, role: self.signUpOption.text!)
        self.clientInfo.country = countryName
    }
    
    func configureUI(){
        if (selectedOption != nil) {
            signUpOption.text = selectedOption
            phone.text = dialCode
            
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let phoneVC = segue.destination as! VerifyCodeViewController
        phoneVC.clientInfo.name = self.clientInfo.name
        phoneVC.clientInfo.phoneNumber = self.clientInfo.phoneNumber
        phoneVC.clientInfo.password = self.clientInfo.password
    }
    
    //function to dismiss the keyboard when done editing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.phone.resignFirstResponder()
        return true
    }
    
    
    
    //function to dissmiss the keyboard when a part of the screen is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: Rather use the IQ Keyboard component
        self.view.endEditing(true)
    }
    
    

}
