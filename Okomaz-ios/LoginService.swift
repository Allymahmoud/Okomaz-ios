//
//  LoginService.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/12/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Gloss


class LoginService: AccessTokenServiceDelegate {
    var ref: DatabaseReference!
    var loginServiceDelegate: LoginServiceDelegate?
    var accessTokenService: AccessTokenService!
    var user: ClientDTO!
    
    init() {
        ref = Database.database().reference(fromURL: Constants.API.BaseUrl)
        print("initialized")
        accessTokenService = AccessTokenService()
        accessTokenService.accessTokenServiceDelegate = self
    }
    
    func login(loginRequest: LoginRequest) {
        // On success
        print("login| LoginService")
        print(loginRequest.phone!+loginRequest.password!)
        
        ref.child("users").child(loginRequest.phone!).observeSingleEvent(of: .value, with: { (snapshot) in
            print("in 0")
            
            // Get user value
            let value = snapshot.value as? NSDictionary
            print("Error 1")
            if value != nil {
                print(value!)
                
                let clientNew: ClientDTO = ClientDTO(json: value as! JSON)!
                if clientNew.password == loginRequest.password{
                    self.user = clientNew
                    
                    self.accessTokenService.storeAccessToken(accessToken: loginRequest.phone)
                    self.accessTokenService.isTokenValid()
                }
                else{
                    self.accessTokenIsInvalid()
                }
            }
            else{
                self.accessTokenIsInvalid()
                
            }
        }) { (error) in
            print("Error")
            print(error.localizedDescription)
            self.accessTokenIsInvalid()
            
        }
        
    }
    
    func accessTokenIsValid() {
        print("RGB USER phone:" + user.phoneNumber!)
        loginServiceDelegate?.didLoginSuccessfully(loggedInUser: user) // TODO: Return a proper user instance...
    }
    
    func accessTokenIsInvalid() {
        loginServiceDelegate?.failedToLogin()
    }
    

}
