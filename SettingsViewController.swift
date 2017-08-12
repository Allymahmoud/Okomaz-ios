//
//  SettingsViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/12/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var accessTokenService: AccessTokenService = AccessTokenService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        accessTokenService.deleteAccessToken()
        navTologin()
    }
    
    
    func navTologin(){
        let loginViewController = LoginViewController.storyboardInstance()
        self.present(loginViewController, animated: true, completion: nil)
        
    }

}
