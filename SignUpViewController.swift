//
//  SignUpViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/7/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class SignUpViewController: UITabBarController {
    
    var selectedAccountOption: String!
    
    
    @IBOutlet weak var signUpOption: UILabel!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var verifyPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        

        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        self.signUpOption.text = self.selectedAccountOption
    }

    
    @IBAction func signUp(_ sender: Any) {
        
    }

}
