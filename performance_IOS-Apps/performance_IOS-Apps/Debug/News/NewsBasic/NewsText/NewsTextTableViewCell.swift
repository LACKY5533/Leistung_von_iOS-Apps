//
//  NewsTextTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 26.11.2021.
//

import UIKit

class NewsTextTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!
    func configure(newsText: String) {
        
        self.newsTextLabel.text = newsText
    }
    
}
