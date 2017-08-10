//
//  SignUpViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/10/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var signUpOption: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var verifyPassword: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    var selectedOption: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
        configureUI()
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(_ sender: Any) {
    }
    
    func configureUI(){
        if (selectedOption != nil) {
            signUpOption.text = selectedOption
        }
    }
    
    

}
