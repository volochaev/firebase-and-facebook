//
//  Post.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 03/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import Foundation

class Post {
    private var _postDescription: String!
    private var _postImageUrl: String?
    private var _postLikes: Int!
    private var _postAuthor: String!
    private var _postId: String!
    
    var postDescription: String {
        return _postDescription
    }
    
    var postImageUrl: String? {
        return _postImageUrl
    }
    
    var postLikes: Int {
        return _postLikes
    }
    
    var postAuthor: String {
        return _postAuthor
    }
    
    var postId: String {
        return _postId
    }
    
    init(description: String, imageUrl: String?, author: String) {
        self._postDescription = description
        self._postImageUrl = imageUrl
        self._postAuthor = author
    }
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._postId = key
        
        if let likes = dictionary["likes"] as? Int {
            self._postLikes = likes
        }
        
        if let imageUrl = dictionary["image_url"] as? String {
            self._postImageUrl = imageUrl
        }
        
        if let description = dictionary["description"] as? String {
            self._postDescription = description
        }
    }
}