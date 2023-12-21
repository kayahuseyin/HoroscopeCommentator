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
    var savedUserID: String?
    var savedPassword: String?
    var savedBirthday: String?
    var savedBirthTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        savedUserID = UserDefaults.standard.string(forKey: "UserID")
        savedPassword = UserDefaults.standard.string(forKey: "Password")
        savedBirthday = UserDefaults.standard.string(forKey: "Birthday")
        savedBirthTime = UserDefaults.standard.string(forKey: "BirthTime")
        
        userIdTextField.text = ""
        passwordTextField.text = ""
        
        //print(defaults.string(forKey: "UserID") ?? "Boş ID")
        //print(defaults.string(forKey: "Password") ?? "Boş Password")
        
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

