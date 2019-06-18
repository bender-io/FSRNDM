//
//  Comment.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/17/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

class Comment {
    
    private(set) var username: String
    private(set) var timestamp: Date
    private(set) var commentText: String
    
    init(username: String, timestamp: Date, commentText: String) {
        self.username = username
        self.timestamp = timestamp
        self.commentText = commentText
    }
}
