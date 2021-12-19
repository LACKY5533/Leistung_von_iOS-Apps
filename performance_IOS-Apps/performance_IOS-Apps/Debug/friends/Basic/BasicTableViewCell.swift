//
//  BasicTableViewCell.swift
//  lesson-3
//
//  Created by LACKY on 13.09.2021.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var friendLabel: UILabel!
    @IBOutlet weak var friendPhotoImage: UIImageView!
    
    
    func configure(with item: Friend) {
        self.friendLabel.text = item.fullName
        
        if let imageURL = URL(string: item.photo100) {
            friendPhotoImage.load(url: imageURL)
        }
    }
}
