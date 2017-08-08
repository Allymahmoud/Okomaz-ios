//
//  SignUpOptionsViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class SignUpOptionsViewController: UIViewController {
    var selectedAccountOption: String!
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
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
        signUpVC.selectedAccountOption = self.selectedAccountOption
    }

}
