//
//  NewsPhotoTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 26.11.2021.
//

import UIKit

class NewsPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    
    func configure(name: String) {
        
        self.newsImageView.image = UIImage(named: name)
    }
    
}
