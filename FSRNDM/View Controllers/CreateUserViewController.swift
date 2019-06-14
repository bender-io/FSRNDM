//
//  CreateUserViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

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
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let username = usernameTextField.text else { return }
    
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
            }
            
            guard let user = authResult?.user else { return }
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                if let error = error {
                    print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                }
            })
            let userID = user.uid
            Firestore.firestore().collection(ReferenceKeys.users).document(userID).setData([
                Constants.username : username,
                Constants.dateCreated : FieldValue.serverTimestamp()], completion: { (error) in
                if let error = error {
                    print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
