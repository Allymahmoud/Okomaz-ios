//
//  SignUpOptionsViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class SignUpOptionsViewController: UIViewController {

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
    

   

}
