//
//  LoginRequest.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/12/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import Foundation
struct LoginRequest {
    
    let phone: String?
    let password: String?
    
    init(phone: String, password: String) {
        self.phone = phone
        self.password = password
    }
}
