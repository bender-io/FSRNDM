//
//  Thought.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/12/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Thought {
    
    private(set) var username: String
    private(set) var timestamp: Date
    private(set) var thoughtText: String
    private(set) var likesCount: Int
    private(set) var commentCount: Int
    private(set) var documentID: String
    
    init(username: String, timestamp: Date, thoughtText: String, likesCount: Int, commentCount: Int, documentID: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughtText = thoughtText
        self.likesCount = likesCount
        self.commentCount = commentCount
        self.documentID = documentID
    }
}

extension Thought : Equatable {
    static func == (lhs: Thought, rhs: Thought) -> Bool {
        return lhs.username == rhs.username && lhs.timestamp == rhs.timestamp
    }
}
