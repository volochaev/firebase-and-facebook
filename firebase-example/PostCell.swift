//
//  PostCell.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var showcaseImg: UIImageView!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postAuthor: UILabel!
    @IBOutlet weak var postAuthorImg: UIImageView!
    @IBOutlet weak var postLikes: UILabel!

    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        postAuthorImg.clipsToBounds = true
        showcaseImg.clipsToBounds = true
    }

    override func drawRect(rect: CGRect) {
        postAuthorImg.layer.cornerRadius = postAuthorImg.frame.size.width / 2
    }
    
    func configureCell(post: Post) {
        self.post = post
        self.postDescription.text = post.postDescription
        self.postLikes.text = "\(post.postLikes)"
        
        
    }
}
