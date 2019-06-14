//
//  CreateUserViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createUserButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    
    // MARK: - IBActions
    @IBAction func createUserButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
}
