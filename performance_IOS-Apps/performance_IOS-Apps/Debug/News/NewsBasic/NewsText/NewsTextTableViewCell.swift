//
//  NewsTextTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 26.11.2021.
//

import UIKit

class NewsTextTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var heightText: NSLayoutConstraint!
    
    func configure(newsText: String) {
        
        self.newsTextLabel.text = newsText
    }
    
    var count = 0
    @IBAction func showMorePress(_ sender: Any) {
        let newsViewController = NewsVKViewController()
        count += 1
        if (count % 2) != 0{
            newsTextLabel.numberOfLines += 1
            heightText.constant += 50
            newsViewController.view.layoutIfNeeded()

        } else {

            newsTextLabel.numberOfLines += 5
            heightText.constant += 100
            newsViewController.view.layoutIfNeeded()
        }
    }
    
}
