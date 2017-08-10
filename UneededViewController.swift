//
//  UneededViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/10/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import Foundation

class UneededViewController: ViewController{
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduledTimerWithTimeInterval()
    
    
    }
    
    //Timer function
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.triggerStoresRequest), userInfo: nil, repeats: true)
    }
    
    
    func triggerStoresRequest(){
        
    }
    
}
