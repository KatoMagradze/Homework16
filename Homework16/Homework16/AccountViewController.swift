//
//  AccountViewController.swift
//  Homework16
//
//  Created by Kato on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    
    var isDarkMode = false

    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var letterTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        checkForStylePreference()
        checkForSaveLetter()
            
        
    }
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ? .darkGray : .white
            self.letterTextView.backgroundColor = self.isDarkMode ? .lightGray : .white
        }
    }
    
    @IBAction func didChangeStypeSegmentedControl(_ sender: UISegmentedControl) {
        
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference()
        updateStyle()
    }
    
    
    @IBAction func saveLetterTapped(_ sender: UIButton) {
        saveLetter()
    }
    
    
    @IBAction func signOutTapped(_ sender: UIButton) {
        
        if let firstViewController = self.navigationController?.viewControllers.first {
            
            self.navigationController?.popToViewController(firstViewController, animated: true)
        }
        
    }
    
    func saveStylePreference() {
        UserDefaults.standard.set(isDarkMode, forKey: "prefersDarkMode")
    }
    
    func checkForStylePreference() {
        let prefersDarkMode = UserDefaults.standard.bool(forKey: "prefersDarkMode")
        
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    func saveLetter() {
        UserDefaults.standard.set(letterTextView.text!, forKey: "letter")
    }
    
    func checkForSaveLetter() {
        let letter = UserDefaults.standard.value(forKey: "letter") as? String ?? ""
        
        letterTextView.text = letter
    }
    

}
