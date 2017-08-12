//
//  Client.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/11/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//


import Foundation
import Gloss

class Client{
    
    //core varibles
    var name: String?
    var phoneNumber: String?
    var email:String?
    var password: String?
    
    //address variables
    var houseNumber: String?
    var street: String?
    var region: String?
    var country: String?
    
    //access code
    var uniqueDustbinSetCode: String?
    
    //timing infomation
    var dateJoined: String?
    var lastContactTime: String?
    var nextPickupDate: String?
    var pickUpStatus: Bool?
    
    //house hold contact variables
    var phoneNumber_1: String?
    var phoneNumber_2: String?
    var phoneNumber_3: String?
    var phoneNumber_4: String?
    
    //previledge
    var role: String?
    var title: String?
    
    //location
    var Longitude: Double?
    var Latitude: Double?
    
    //PhotoUrl
    var PhotoUrl: String?
    var channels = [String]()
    

    init(name: String, phoneNumber: String, password: String, role: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        
        self.email = ""
        
        self.houseNumber = ""
        self.street = ""
        self.region = ""
        self.country = "Tanzania"
        
        
        //access code
        self.uniqueDustbinSetCode = ""
        
        //timing infomation
        self.dateJoined = ""
        self.lastContactTime = ""
        self.nextPickupDate = "nil"
        self.pickUpStatus = false
        
        //house hold contact variables
        self.phoneNumber_1 = ""
        self.phoneNumber_2 = ""
        self.phoneNumber_3 = ""
        self.phoneNumber_4 = ""
        
        //previledge
        self.role = role
        self.title = ""
        
        //location
        self.Longitude = 0
        self.Latitude = 0
        
        //url
        self.PhotoUrl = ""
        self.channels = []
 
    }
    
    
}






