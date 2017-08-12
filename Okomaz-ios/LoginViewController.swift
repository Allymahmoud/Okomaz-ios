//
//  LoginViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/2/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Gloss

class LoginViewController: UIViewController {
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var ref: DatabaseReference!
    var clientInfo: Client!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        ref = Database.database().reference(fromURL: Constants.API.BaseUrl)
        
        

        // Do any additional setup after loading the view.
    }
    
    static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil)
        let loginViewController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        return loginViewController
    }

  

    @IBAction func login(_ sender: Any) {
        if !phone.hasText || !passwordField.hasText {
            self.present(AlertUtil.errorAlert(title: "Could Not Login", message: "Text fields cannot be empty"), animated: true, completion: nil)
        }
        else if (phone.text?.characters.count)! < 9 || (phone.text?.characters.count)! > 15{
            self.present(AlertUtil.errorAlert(title: "Could Not Login", message: "Incorrect Phone Number Format"), animated: true, completion: nil)
        }
       
        else{
            updateClientInfo()
            
        }
        
        
        
    }
    
    func updateClientInfo(){
        let phoneNumber = phone.text!
        ref.child("users").child(phoneNumber).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            if value != nil {
                print(value!)
                
                let clientNew: ClientDTO = ClientDTO(json: value as! JSON)!
                if clientNew.password == self.passwordField.text!{
                     self.navTomain()
                    
                }
                else{
                    self.present(AlertUtil.errorAlert(title: "Could Not Login", message: "Password or Phone Number does not match"), animated: true, completion: nil)
                    
                }
                /*
                self.clientInfo.name = (value?["name"] as! String)
                self.clientInfo.password = value?["password"] as? String ?? ""
                self.clientInfo.email = value?["email"] as? String ?? ""
                self.clientInfo.phoneNumber = value?["phoneNumber"] as? String ?? ""
                
                self.clientInfo.houseNumber = value?["houseNumber"] as? String ?? ""
                self.clientInfo.street = value?["street"] as? String ?? ""
                self.clientInfo.region = value?["region"] as? String ?? ""
                self.clientInfo.country = value?["country"] as? String ?? ""
                
                self.clientInfo.uniqueDustbinSetCode = value?["uniqueDustbinSetCode"] as? String ?? ""
                self.clientInfo.dateJoined = value?["dateJoined"] as? String ?? ""
                self.clientInfo.lastContactTime = value?["lastContactTime"] as? String ?? ""
                self.clientInfo.nextPickupDate = value?["nextPickupDate"] as? String ?? ""
                self.clientInfo.pickUpStatus = value?["pickUpStatus"] as? Bool
                
                self.clientInfo.phoneNumber_1 = value?["phoneNumber_1"] as? String ?? ""
                self.clientInfo.phoneNumber_2 = value?["phoneNumber_2"] as? String ?? ""
                self.clientInfo.phoneNumber_3 = value?["phoneNumber_3"] as? String ?? ""
                self.clientInfo.phoneNumber_4 = value?["phoneNumber_4"] as? String ?? ""
                
                self.clientInfo.role = value?["role"] as? String ?? ""
                self.clientInfo.title = value?["title"] as? String ?? ""
                self.clientInfo.Latitude = value?["Latitude"] as? Double
                self.clientInfo.Longitude = value?["Longitude"] as? Double
                self.clientInfo.PhotoUrl = value?["PhotoUrl"] as? String ?? ""
                self.clientInfo.channels = value?["channels"] as? Array ?? [""]
                */
                
               
 

                
            }
            else{
                print("found nil")
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }

    
    }
        

    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "navToRegisterOptions", sender: nil)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
    }
    
    func navTomain(){
        print(clientInfo.name! + clientInfo.phoneNumber!)
        let mainViewController = MainViewController.storyboardInstance()
        self.present(mainViewController, animated: true, completion: nil)

    }
    


}
