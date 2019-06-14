//
//  LoginViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

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
    }
    @IBAction func createUserButtonTapped(_ sender: Any) {
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
