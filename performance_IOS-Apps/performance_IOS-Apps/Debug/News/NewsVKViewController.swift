//
//  NewsVKViewController.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 15.11.2021.
//

import UIKit
import RealmSwift

class NewsVKViewController: UITableViewController {
    
    private let newsService = NewsAPI()
    
    private var news: [News] = []
    private var groups: [GroupsNews] = []
    private var profiles: [Profile] = []
    
//    private var token: NotificationToken?
    
//    private var feeds: Feed = []
    
//    private enum NewsFeedCells {
//        case text
//        case photo
//        case authorAndDate
//        case likesAndComments
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(R.Nib.NewsText, forCellReuseIdentifier: R.Cell.NewsText)
        self.tableView.register(R.Nib.NewsPhoto, forCellReuseIdentifier: R.Cell.NewsPhoto)
        self.tableView.register(R.Nib.NewsAuthorAndDate, forCellReuseIdentifier: R.Cell.NewsAuthorAndDate)
        self.tableView.register(R.Nib.NewsLikesAndComments, forCellReuseIdentifier: R.Cell.NewsLikesAndComments)
        
        newsService.getNews { [weak self] news, groups, profiles in
            guard let self = self else {return}

            self.news = news
            self.groups = groups
            self.profiles = profiles
            
            self.tableView.reloadData()
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0: return tableView.dequeueReusableCell(withIdentifier: R.Cell.NewsText, for: indexPath)
        case 1: return tableView.dequeueReusableCell(withIdentifier: R.Cell.NewsPhoto, for: indexPath)
        case 2: return tableView.dequeueReusableCell(withIdentifier: R.Cell.NewsAuthorAndDate, for: indexPath)
        case 3: return tableView.dequeueReusableCell(withIdentifier: R.Cell.NewsLikesAndComments, for: indexPath)
        
        default:
            return tableView.dequeueReusableCell(withIdentifier: R.Cell.NewsText, for: indexPath)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? NewsTableViewCell)?.configure(with: self.news[indexPath.row])
        
        if self.news.count == 0 {
            (cell as? NewsTextTableViewCell)?.configure(newsText: "testtesttest")
            } else {
                (cell as? NewsTextTableViewCell)?.configure(newsText: self.news[0].text)
                }
        
        (cell as? NewsPhotoTableViewCell)?.configure(name: "123")
        (cell as? NewsAuthorAndDateTableViewCell)?.configure(author: "Nikita", date: "26.11.2021")
        (cell as? NewsLikesAndCommentsTableViewCell)?.configure(likes: 123, comments: 14)
        }
}
