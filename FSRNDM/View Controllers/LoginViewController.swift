//
//  LoginViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        createUserButton.layer.cornerRadius = 10

    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.handleError(error)
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
            }
            else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
