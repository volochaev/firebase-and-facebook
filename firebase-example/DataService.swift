//
//  DataService.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://fiery-torch-5814.firebaseio.com"

class DataService {
    static let sharedInstance = DataService()
    
    private var _REF_BASE  = Firebase(url: "\(BASE_URL)")
    private var _REF_POSTS = Firebase(url: "\(BASE_URL)/posts")
    private var _REF_USERS = Firebase(url: "\(BASE_URL)/users")
    
    var REF_BASE:  Firebase { return _REF_BASE }
    var REF_POSTS: Firebase { return _REF_POSTS }
    var REF_USERS: Firebase { return _REF_USERS }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}