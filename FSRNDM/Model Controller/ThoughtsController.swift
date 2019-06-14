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
    var thoughtsListener : ListenerRegistration?

    // MARK: - CRUD Method
    func setListenerFor(category: String, completion: @escaping(Bool) -> Void) {
        
        if category == ThoughtCategory.popular {
            thoughtsListener = thoughtsCollectionRef?
                .order(by: Constants.likesCount, descending: true)
                .addSnapshotListener { (snapshot, error) in
                    if let error = error {
                        print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                        completion(false)
                        
                    } else {
                        self.thoughts = self.parseData(snapshot: snapshot)
                        completion(true)
                    }
                }
            
        } else {
            thoughtsListener = thoughtsCollectionRef?
                .whereField(Constants.category, isEqualTo: category)
                .order(by: Constants.timestamp, descending: true)
                .addSnapshotListener { (snapshot, error) in
                    if let error = error {
                        print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                        completion(false)
                        
                    } else {
                        self.thoughts = self.parseData(snapshot: snapshot)
                        completion(true)
                    }
                }
        }
    }
    
    func createThoughtWith(category: String, username: String, thoughtText: String) {
        Firestore.firestore().collection(ReferenceKeys.thoughts).addDocument(data: [
            Constants.category : category,
            Constants.commentCount : 0,
            Constants.likesCount : 0,
            Constants.thoughtText : thoughtText,
            Constants.timestamp : FieldValue.serverTimestamp(),
            Constants.username : username]) { (error) in
            if let error = error {
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
            } else {
                print("thought saved!")
            }
        }
    }
    
    func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        
        guard let snapshot = snapshot else { return [] }
        
        var thoughts : [Thought] = []
        for document in snapshot.documents {
            let data = document.data()
            let username = data[Constants.username] as? String ?? "Anonymous"
            let timestampUgly = data[Constants.timestamp] as? Timestamp ?? Timestamp()
            let timestampPretty = timestampUgly.dateValue()
            let thoughtText = data[Constants.thoughtText] as? String ?? ""
            let likesCount = data[Constants.likesCount] as? Int ?? 0
            let commentCount = data[Constants.commentCount] as? Int ?? 0
            let documentID = document.documentID
            
            let newThought = Thought(username: username, timestamp: timestampPretty, thoughtText: thoughtText, likesCount: likesCount, commentCount: commentCount, documentID: documentID)
            
            thoughts.append(newThought)
        }
        return thoughts
    }
}
