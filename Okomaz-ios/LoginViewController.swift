//
//  LoginViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Gloss

class LoginViewController: UIViewController, UITextFieldDelegate, AccessTokenServiceDelegate, LoginServiceDelegate {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var ref: DatabaseReference!
    var clientInfo: Client!
    
    var accessTokenService: AccessTokenService!
    var loginService: LoginService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        ref = Database.database().reference(fromURL: Constants.API.BaseUrl)
        
        accessTokenService = AccessTokenService()
        accessTokenService.accessTokenServiceDelegate = self
        
        loginService = LoginService()
        loginService.loginServiceDelegate = self
        accessTokenService.isTokenValid()
    }
    
    static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil)
        let loginViewController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        return loginViewController
    }

  

    @IBAction func login(_ sender: Any) {
        
        if !phone.hasText || !passwordField.hasText {
            self.present(AlertUtil.errorAlert(title: "Could Not Login", message: "Text fields cannot be empty"), animated: true, completion: nil)
        }
        else if (phone.text?.characters.count)! < 9 || (phone.text?.characters.count)! > 15{
            self.present(AlertUtil.errorAlert(title: "Could Not Login", message: "Incorrect Phone Number Format"), animated: true, completion: nil)
        }
       
        else{
            self.loadingIndicator.startAnimating()
            let loginRequest = LoginRequest(phone: self.phone.text!, password: self.passwordField.text!)
            loginService.login(loginRequest: loginRequest)
        }
        
        
        
    }
    
    func accessTokenIsValid() {
        navTomain()
    }
    
    func accessTokenIsInvalid() {
        // Do nothing
    }
    
    func didLoginSuccessfully(loggedInUser: ClientDTO) {
        print(loggedInUser.name!)
        self.loadingIndicator.stopAnimating()
        navTomain()
    }
    
    
    func failedToLogin() {
        print("failed to login")
        self.loadingIndicator.stopAnimating()
        
        self.present(AlertUtil.errorAlert(title: "Could not login", message: "Invalid phone or password" ), animated: true, completion: nil)
        // TODO: Displaying an error message to the user
    }
        

    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "navToRegisterOptions", sender: nil)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
    }
    
    func navTomain(){
        let mainViewController = MainViewController.storyboardInstance()
        self.present(mainViewController, animated: true, completion: nil)

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
