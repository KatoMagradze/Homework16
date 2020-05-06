//
//  ViewController.swift
//  Homework16
//
//  Created by Kato on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var enteredName = UDManager.getFirstName()
    var enteredPassword = UDManager.getPassword()
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       /*if UDManager.isFirstPageLaunched() {
            let accountvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "account_vc")
            self.navigationController?.pushViewController(accountvc, animated: false)

        }
         */
        
       // UDManager.markFirstPageIsLaunched()
        
        nameTextField.text = enteredName
        passwordTextField.text = enteredPassword
        
    }
    
    
    @IBAction func logInTapped(_ sender: UIButton) {

        
        UDManager.saveFirstName(value: enteredName)
        UDManager.savePassword(value: enteredPassword)
 
        
    if UDManager.getFirstName() == nameTextField.text && UDManager.getPassword() == passwordTextField.text {
                
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "account_vc")
                //self.navigationController?.pushViewController(accountvc, animated: true)
            }
                
            else {
                let alert1 = UIAlertController(title: "Try Again", message: "Wrong information entered", preferredStyle: .alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert1, animated: true, completion: nil)
            }
        
    }
}

class UDManager {
    
    internal static let KEY_FIRST_NAME = "KEY_FIRST_NAME"
    internal let KEY_LAST_NAME  = "KEY_LAST_NAME"
    internal static let KEY_PASSWORD = "KEY_PASSWORD"
    
    static let KEY_FIRST_PAGE_LAUNCHED = "KEY_FIRST_PAGE_LAUNCHED"
 
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
    
    static func saveFirstName(value: String) {
        getUD().set(value, forKey: KEY_FIRST_NAME)
    }
    
    static func savePassword(value: String) {
        getUD().set(value, forKey: KEY_PASSWORD)
    }
    
    static func getFirstName() -> String {
        return getUD().string(forKey: KEY_FIRST_NAME) ?? ""
    }
    
    static func getPassword() -> String {
        return getUD().string(forKey: KEY_PASSWORD) ?? ""
    }
    
    static func markFirstPageIsLaunched() {
        getUD().set(true, forKey: KEY_FIRST_PAGE_LAUNCHED)
    }
    
    static func unmarkFirstPageIsLaunched() {
        getUD().set(false, forKey: KEY_FIRST_PAGE_LAUNCHED)
    }
    
    static func isFirstPageLaunched() -> Bool {
        return getUD().bool(forKey: KEY_FIRST_PAGE_LAUNCHED)
    }
}


