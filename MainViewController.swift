//
//  ViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/3/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Static Functions
    
    static func storyboardInstance() -> MainViewController {
        let storyboard = UIStoryboard(name: String(describing: MainViewController.self), bundle: nil)
        
        let mainViewController = storyboard.instantiateInitialViewController() as! MainViewController
        
        return mainViewController
    }
    
    
    

   

}
