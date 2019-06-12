//
//  AddThoughViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/11/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class AddThoughtVC: UIViewController, UITextViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var thoughtTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postButton.layer.cornerRadius = 5
        thoughtTextView.layer.cornerRadius = 18
        thoughtTextView.text = "My random thought..."
        thoughtTextView.textColor = .lightGray
        thoughtTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .darkGray
    }
    
    // MARK : - IBActions
    @IBAction func categoryTapped(_ sender: UISegmentedControl) {
    }
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
    }
}
