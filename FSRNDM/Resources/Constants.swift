//
//  Constants.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/12/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

enum Constants {
    static let category = "category"
    static let commentCount = "commentCount"
    static let likesCount = "likesCount"
    static let thoughtText = "thoughtText"
    static let timestamp = "timestamp"
    static let username = "username"
    static let dateCreated = "dateCreated"
}

enum ThoughtCategory {
    static let funny = "funny"
    static let serious = "serious"
    static let crazy = "crazy"
    static let popular = "popular"
}

enum ReferenceKeys {
    static let thoughts = "thoughts"
    static let users = "users"
}
