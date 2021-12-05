//
//  NewsAuthorAndDateTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 26.11.2021.
//

import UIKit

class NewsAuthorAndDateTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(author: String, date: String) {
        
        self.authorLabel.text = author
        self.dateLabel.text = date
    }
    
}
