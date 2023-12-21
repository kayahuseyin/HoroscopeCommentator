//
//  ViewController.swift
//  HoroscopeCommentator
//
//  Created by Hüseyin Kaya on 20.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let defaults = UserDefaults()
    let savedUserID = UserDefaults.standard.string(forKey: "UserID")
    let savedPassword = UserDefaults.standard.string(forKey: "Password")
    let savedBirthday = UserDefaults.standard.string(forKey: "Birthday")
    let savedBirthTime = UserDefaults.standard.string(forKey: "BirthTime")
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        if userIdTextField.text == savedUserID && passwordTextField.text == savedPassword {
            performSegue(withIdentifier: "segue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Denied", message: "User Id or password entered wrong", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true )
        }
      
    }
    
    
    
}

