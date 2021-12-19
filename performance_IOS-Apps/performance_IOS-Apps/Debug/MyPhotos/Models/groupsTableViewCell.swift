//
//  groupsTableViewCell.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 25.10.2021.
//

import UIKit

class groupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupPhotoImage: UIImageView!
    
    func configure(with item: Group) {
        self.groupLabel.text = item.screenName
        
        if let imageURL = URL(string: item.photo100) {
            groupPhotoImage.load(url: imageURL)
        }
    }
    
}
