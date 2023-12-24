//
//  SignUpViewController.swift
//  HoroscopeCommentator
//
//  Created by Hüseyin Kaya on 20.12.2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var birthdayTextField: UITextField!
    @IBOutlet var birthTimeTextField: UITextField!
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        birthdayTextField.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        birthTimeTextField.inputView = timePicker
        
        datePicker?.addTarget(self, action: #selector(handlePickerChange(_:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(handlePickerChange(_:)), for: .valueChanged)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handlePickerChange(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        if sender == datePicker {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            birthdayTextField.text = dateFormatter.string(from: sender.date)
        } else if sender == timePicker {
            dateFormatter.dateFormat = "HH:mm"
            birthTimeTextField.text = dateFormatter.string(from: sender.date)
        }
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if userIdTextField.hasText  && passwordTextField.hasText && birthdayTextField.hasText && birthTimeTextField.hasText {
            defaults.setValue("\(userIdTextField.text ?? "Empty")", forKey: "UserID")
            defaults.setValue("\(passwordTextField.text ?? "Empty")", forKey: "Password")
            defaults.setValue("\(birthdayTextField.text ?? "Empty")", forKey: "Birthday")
            defaults.setValue("\(birthTimeTextField.text ?? "Empty")", forKey: "BirthTime")
            
            //print(defaults.string(forKey: "UserID") ?? "Boş ID")
            //print(defaults.string(forKey: "Password") ?? "Boş Password")
            
            showSuccessAlert()
        } else {
            showIncompleteAlert()
        }
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "You successfully created a profile", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alert.addAction(okayAction)
        self.present(alert, animated: true)
    }

    func showIncompleteAlert() {
        let alertController = UIAlertController(title: "Denied", message: "You couldn't create a profile", preferredStyle: .alert)
        let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) { _ in
            
        }
        
        alertController.addAction(tryAgainAction)
        self.present(alertController, animated: true)
    }
    
}
