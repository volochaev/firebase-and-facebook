//
//  PostCell.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var showcaseImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        profileImg.clipsToBounds = true
        showcaseImg.clipsToBounds = true
    }

    override func drawRect(rect: CGRect) {
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
    }
}
