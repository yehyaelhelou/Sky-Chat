//
//  LoginViewController.swift
//  Sky Chat
//
//  Created by Yehya elhelou on 9/13/23.
//


// LoginViewController.swift


import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, !email.isEmpty,
              let password = passwordTextfield.text, !password.isEmpty else {
            showAlert(message: "Please enter both email and password.")
            return
        }
        
        if !email.hasSuffix("@gmail.com") {
            showAlert(message: "Please enter a valid Gmail address.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                self?.showAlert(message: e.localizedDescription)
            } else {
                self?.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
