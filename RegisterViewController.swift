//
//  RegisterViewController.swift
//  mParticleDemo
//
//  Created by Merritt Tidwell on 5/26/18.
//  Copyright © 2018 Merritt Tidwell. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var alertController : UIAlertController?
    var isAlertControllerDisplayed = false
    
    
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var rePasswordView: UIView!
    
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rePasswordTF: UITextField!
    
    
    var signUpDict = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
        
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func checkFieldsValid () -> Bool {
        
        let firstName = firstNameTF?.text ?? ""
        guard firstName != "" else {
            return false
        }
        
        let lastName = lastNameTF?.text ?? ""
        guard lastName != "" else {
            return false
        }
        
        let fullName = firstName + " " + lastName
        
        signUpDict["fullName"] = fullName
        
        let email = self.emailTF.text ?? ""
        guard email != "" else {
            return false
        }
        
        signUpDict["email"] = email
        
        let pwd = passwordTF?.text ?? ""
        let repwd = rePasswordTF.text ?? ""
        guard pwd != "" && pwd == repwd else {
            return false
        }
        
        signUpDict["password"] = pwd
        
        return true
        
    }
    
    func saveValues(values : [String: String]) {
        
        let userDefaults = UserDefaults.standard
        
        for (k,v) in values {
            
            userDefaults.setValue(v, forKey: k)
            
        }
        
    }
    
    
    @IBAction private func showPhoneInfoScreen() {
        print("sign up")
        
        if checkFieldsValid()  {
            
            saveValues(values: signUpDict)
            
          //  self.performSegue(withIdentifier: "showPhoneDetails", sender: nil)
            
        }else {
            
            return
            
        }
        
        
    }
}

