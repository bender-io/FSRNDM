//
//  ThoughtTableViewCell.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/12/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ThoughtTableViewCell: UITableViewCell {

    // MARK: - Landing Thought
    private var thought : Thought?
    
    //MARK: - IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        starImage.addGestureRecognizer(tapRecognizer)
        starImage.isUserInteractionEnabled = true
    }
    
    //MARK: - Methods
    func configureCell(thought: Thought) {
        self.thought = thought
        usernameLabel.text = thought.username
        timestampLabel.text = "\(thought.timestamp)"
        thoughtLabel.text = thought.thoughtText
        likesCountLabel.text = "\(thought.likesCount)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLabel.text = timestamp
    }
    
    @objc func likeTapped() {
        guard let thought = thought else { return }
        Firestore.firestore().collection(ReferenceKeys.thoughts).document(thought.documentID)
            .updateData([Constants.likesCount : thought.likesCount + 1])
    }
}
