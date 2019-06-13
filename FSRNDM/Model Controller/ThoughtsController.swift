//
//  ModelController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ThoughtsController {
    
    // MARK: - Source of Truth
    var thoughts : [Thought] = []
    
    // MARK: - Singleton
    static let shared = ThoughtsController()
    private init() {}
    
    // MARK: - Firestore
    var thoughtsCollectionRef : CollectionReference?    

    // MARK: - CRUD Methods
    func fetchAllThoughts(completion: @escaping(Bool) -> Void ) {
        thoughtsCollectionRef?.getDocuments { (snapshot, error) in
            if let error = error {
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                completion(false)
            } else {
                guard let snapshot = snapshot else { completion(false) ; return }
                
                var thoughts : [Thought] = []
                for document in snapshot.documents {
                    let data = document.data()
                    let username = data[Constants.username] as? String ?? "Anonymous"
                    // TODO: - Fix Date Fetch
                    let timestampUgly = data[Constants.timestamp] as? Timestamp ?? Timestamp()
                    let timestampPretty = timestampUgly.dateValue()
                    let thoughtText = data[Constants.thoughtText] as? String ?? ""
                    let likesCount = data[Constants.likesCount] as? Int ?? 0
                    let commentCount = data[Constants.commentCount] as? Int ?? 0
                    let documentID = document.documentID
                    
                    let newThought = Thought(username: username, timestamp: timestampPretty, thoughtText: thoughtText, likesCount: likesCount, commentCount: commentCount, documentID: documentID)
                    
                    thoughts.append(newThought)
                }
                self.thoughts = thoughts
                completion(true)
            }
        }
    }
    
}
