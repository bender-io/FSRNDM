
//
//  CommentsTableViewCell.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/17/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    // MARK: - Methods
    func configureCell(comment: Comment) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        
        usernameLabel.text = comment.username
        commentLabel.text = comment.commentText
        timestampLabel.text = timestamp
    }
}
