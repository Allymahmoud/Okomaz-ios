//
//  LoginServiceDelegate.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/12/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import Foundation
protocol LoginServiceDelegate {
    
    func didLoginSuccessfully(loggedInUser: ClientDTO)
    func failedToLogin()
    
}
