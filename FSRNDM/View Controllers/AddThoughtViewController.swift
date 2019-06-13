//
//  AddThoughViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/11/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AddThoughtViewController: UIViewController, UITextViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet private weak var postButton: UIButton!
    @IBOutlet private weak var categorySegment: UISegmentedControl!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var thoughtTextView: UITextView!
    
    private var selectedCategory = ThoughtCategory.funny
    
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
        switch categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny
        case 1:
            selectedCategory = ThoughtCategory.serious
        default:
            selectedCategory = ThoughtCategory.crazy
        }
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
        Firestore.firestore().collection(ReferenceKeys.thoughts).addDocument(data: [
            Constants.category : selectedCategory,
            Constants.commentCount : 0,
            Constants.likesCount : 0,
            Constants.thoughtText : thoughtTextView.text ?? "",
            Constants.timestamp : FieldValue.serverTimestamp(),
            Constants.username : usernameTextField.text ?? "username"
            
        ]) { (error) in
            if let error = error {
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
