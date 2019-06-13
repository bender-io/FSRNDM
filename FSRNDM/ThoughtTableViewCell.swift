//
//  ThoughtTableViewCell.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/12/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class ThoughtTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thoughtLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    //MARK: - Methods
    func configureCell(thought: Thought) {
        
    }
}
