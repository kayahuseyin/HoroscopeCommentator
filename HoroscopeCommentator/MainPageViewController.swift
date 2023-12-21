//
//  MainPageViewController.swift
//  HoroscopeCommentator
//
//  Created by Hüseyin Kaya on 20.12.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var birthTimeLabel: UILabel!
    
    let defaults = UserDefaults()
    let savedUserID = UserDefaults.standard.string(forKey: "UserID")
    let savedBirthday = UserDefaults.standard.string(forKey: "Birthday")
    let savedBirthTime = UserDefaults.standard.string(forKey: "BirthTime")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        welcomeLabel.text = "Welcome \(savedUserID ?? "")!"
        birthdayLabel.text = "\(savedBirthday ?? "Unknown birthday")"
        birthTimeLabel.text = "\(savedBirthTime ?? "Unkown birth time")"
        
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Exit", message: "Are you sure you want to exit?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let exitAction = UIAlertAction(title: "Exit", style: .destructive) { _ in
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(exitAction)
        
        present(alert, animated: true)
    }
    
}
