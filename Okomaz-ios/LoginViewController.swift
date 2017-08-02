//
//  LoginViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        

        // Do any additional setup after loading the view.
    }
  

    @IBAction func login(_ sender: Any) {
        self.navTomain()
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
    


}
