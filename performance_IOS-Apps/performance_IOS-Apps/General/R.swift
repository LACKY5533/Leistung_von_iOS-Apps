//
//  R.swift
//  lesson-3
//
//  Created by LACKY on 12.09.2021.
//

import UIKit

enum R {
    
    enum Storyboard {
    static let DebugMenu: UIStoryboard = .init(name: "DebugMenu", bundle: nil)
    static let MainSettings: UIStoryboard = .init(name: "MainSettings", bundle: nil)
    static let notifications: UIStoryboard = .init(name: "notifications", bundle: nil)
    static let blackList: UIStoryboard = .init(name: "blackList", bundle: nil)
    static let Main: UIStoryboard = .init(name: "Main", bundle: nil)
    }
    
    enum Nib {
        static let basic: UINib = .init(nibName: "BasicTableViewCell", bundle: nil)
        
        //News
        static let Newsbasic: UINib = .init(nibName: "NewsTableViewCell", bundle: nil)
        static let NewsText: UINib = .init(nibName: "NewsTextTableViewCell", bundle: nil)
        static let NewsPhoto: UINib = .init(nibName: "NewsPhotoTableViewCell", bundle: nil)
        static let NewsAuthorAndDate: UINib = .init(nibName: "NewsAuthorAndDateTableViewCell", bundle: nil)
        static let NewsLikesAndComments: UINib = .init(nibName: "NewsLikesAndCommentsTableViewCell", bundle: nil)
        
        static let groups: UINib = .init(nibName: "groupsTableViewCell", bundle: nil)
        static let photos: UINib = .init(nibName: "photosTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let basic: String = "BasicCell"
        
        //News
        static let Newsbasic: String = "NewsCell"
        static let NewsText: String = "NewsTextCell"
        static let NewsPhoto: String = "NewsPhotoCell"
        static let NewsAuthorAndDate: String = "NewsAuthorAndDateCell"
        static let NewsLikesAndComments: String = "NewsLikesAndCommentsCell"
        
        static let groups: String = "groupsCell"
        static let photos: String = "photosCell"
    }
    
}
