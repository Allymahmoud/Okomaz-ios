//
//  VerifyCodeViewController.swift
//  Okomaz-ios
//
//  Created by Ally Mahmoud on 8/11/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import SinchVerification
import FirebaseDatabase


class VerifyCodeViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var verification: Verification!
    let clientInfo = Client(name: "",phoneNumber: "",password: "", role: "")
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference(fromURL: Constants.API.BaseUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyCode(_ sender: Any) {
        
        
        //self.disableUI(disable: true)
        
        //verifyActivityIndicator.color = UIColor.red
        //verifyActivityIndicator.isHidden = false
        loadingIndicator.startAnimating()
        
        if !code.hasText{
            self.present(AlertUtil.errorAlert(title: "Could not Verify Code", message: "Code field cannot be empty"), animated: true, completion: nil)
        }

        verification = SMSVerification(Constants.API.SinchApplicationKey, phoneNumber: clientInfo.phoneNumber!)
        verification.verify(code.text!, completion: { (success:Bool, error:Error?) -> Void in
            self.loadingIndicator.stopAnimating()
      
            print(success)
            if (success){
                self.uploadClientInfoToDatabase()
                self.navTologin()
                
            } else {
                self.present(AlertUtil.errorAlert(title: "Could not Verify Code", message: "Invalid code Entry"), animated: true, completion: nil)
            }
        })
        

        
    }
    private func uploadClientInfoToDatabase(){
        let phoneNumber = self.clientInfo.phoneNumber
        
        self.ref.child("users").child((phoneNumber)!).child("name").setValue(self.clientInfo.name)
        self.ref.child("users").child((phoneNumber)!).child("email").setValue(self.clientInfo.email)
        self.ref.child("users").child((phoneNumber)!).child("password").setValue(self.clientInfo.password)
        self.ref.child("users").child((phoneNumber)!).child("phoneNumber").setValue(self.clientInfo.phoneNumber)
        self.ref.child("users").child((phoneNumber)!).child("houseNumber").setValue(self.clientInfo.houseNumber)
        self.ref.child("users").child((phoneNumber)!).child("street").setValue(self.clientInfo.street)
        self.ref.child("users").child((phoneNumber)!).child("region").setValue(self.clientInfo.region)
        self.ref.child("users").child((phoneNumber)!).child("country").setValue(self.clientInfo.country)
        self.ref.child("users").child((phoneNumber)!).child("uniqueDustbinSetCode").setValue(self.clientInfo.uniqueDustbinSetCode)
        self.ref.child("users").child((phoneNumber)!).child("dateJoined").setValue(self.clientInfo.dateJoined)
        self.ref.child("users").child((phoneNumber)!).child("lastContactTime").setValue(self.clientInfo.lastContactTime)
        self.ref.child("users").child((phoneNumber)!).child("nextPickupDate").setValue(self.clientInfo.nextPickupDate)
        self.ref.child("users").child((phoneNumber)!).child("pickUpStatus").setValue(self.clientInfo.pickUpStatus)
        self.ref.child("users").child((phoneNumber)!).child("phoneNumber_1").setValue(self.clientInfo.phoneNumber_1)
        self.ref.child("users").child((phoneNumber)!).child("phoneNumber_2").setValue(self.clientInfo.phoneNumber_2)
        self.ref.child("users").child((phoneNumber)!).child("phoneNumber_3").setValue(self.clientInfo.phoneNumber_3)
        self.ref.child("users").child((phoneNumber)!).child("phoneNumber_4").setValue(self.clientInfo.phoneNumber_4)
        self.ref.child("users").child((phoneNumber)!).child("role").setValue(self.clientInfo.role)
        self.ref.child("users").child((phoneNumber)!).child("title").setValue(self.clientInfo.title)
        self.ref.child("users").child((phoneNumber)!).child("Latitude").setValue(self.clientInfo.Latitude)
        self.ref.child("users").child((phoneNumber)!).child("Longitude").setValue(self.clientInfo.Longitude)
        self.ref.child("users").child((phoneNumber)!).child("PhotoUrl").setValue(self.clientInfo.PhotoUrl)
        self.ref.child("users").child((phoneNumber)!).child("channels").setValue(self.clientInfo.channels)
    }

    
    func navTologin(){
        let loginViewController = LoginViewController.storyboardInstance()
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    
    //function to dismiss the keyboard when done editing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.code.resignFirstResponder()
        return true
    }
    
    
    
    //function to dissmiss the keyboard when a part of the screen is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: Rather use the IQ Keyboard component
        self.view.endEditing(true)
    }

   

}
