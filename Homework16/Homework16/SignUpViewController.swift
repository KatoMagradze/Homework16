//
//  SignUpViewController.swift
//  Homework16
//
//  Created by Kato on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var newName = ""
    var newPassword = ""
    var newEmail = ""

    @IBOutlet weak var newNameTextField: UITextField!
    
    @IBOutlet weak var newEmailTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        newName = newNameTextField.text!
        newPassword = newPasswordTextField.text!
        newEmail = newEmailTextField.text!
        
        UDManager.saveFirstName(value: newName)
        UDManager.savePassword(value: newPassword)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "log_in") as! ViewController
        
        vc.enteredName = newNameTextField.text ?? ""
        vc.enteredPassword = newPasswordTextField.text ?? ""
    
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
