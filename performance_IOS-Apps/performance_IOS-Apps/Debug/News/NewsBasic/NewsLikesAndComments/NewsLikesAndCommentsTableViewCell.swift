//
//  NewsLikesAndCommentsTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 26.11.2021.
//

import UIKit

class NewsLikesAndCommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    func configure(likes: Int, comments: Int) {
        
        self.likesLabel.text = String(likes)
        self.commentsLabel.text = String(comments)
    }
    
}
