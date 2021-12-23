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
    private var sizeNews: [SizeNews] = []
    
//    private var token: NotificationToken?
//    private var feeds: Feed = []
    
    private var nextFrom = ""
    private var advanced_index: IndexSet = []
    private var loading = false
    
    func refreshContr() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "подождите...")
        refreshControl?.tintColor = .white
        refreshControl?.addTarget(self, action: #selector(newsRefresh), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(R.Nib.NewsText, forCellReuseIdentifier: R.Cell.NewsText)
        self.tableView.register(R.Nib.NewsPhoto, forCellReuseIdentifier: R.Cell.NewsPhoto)
        self.tableView.register(R.Nib.NewsAuthorAndDate, forCellReuseIdentifier: R.Cell.NewsAuthorAndDate)
        self.tableView.register(R.Nib.NewsLikesAndComments, forCellReuseIdentifier: R.Cell.NewsLikesAndComments)
        
        newsService.getNews { [weak self] feed in
            guard let self = self else {return}

            self.news = (feed?.response.items)!
            self.groups = (feed?.response.groups)!
            self.profiles = (feed?.response.profiles)!
            self.nextFrom = feed?.response.nextFrom ?? ""
            
            self.tableView.reloadData()
        }
    }
    
    @objc func newsRefresh(sender: AnyObject) {
        self.refreshControl?.beginRefreshing()

        let freshNewsDate = self.news.first?.date ?? Date().timeIntervalSince1970.exponent

        newsService.getNews(startTime: Double(freshNewsDate) + 1) { [weak self] news in
            guard let self = self else { return }
            self.refreshControl?.endRefreshing()

            guard let newsNews = news?.response.items else { return }
            guard let profilesNews = news?.response.profiles else { return }
            guard let groupsNews = news?.response.groups else { return }
            guard newsNews.count > 0 else { return }

            self.news = newsNews + self.news
            self.profiles = profilesNews + self.profiles
            self.groups = groupsNews + self.groups

            let indexSet = IndexSet(integersIn: 0..<newsNews.count)
            self.tableView.insertSections(indexSet, with: .fade)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
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
            (cell as? NewsTextTableViewCell)?.configure(newsText: "")
            } else {
                (cell as? NewsTextTableViewCell)?.configure(newsText: self.news[0].text)
                }
        
        (cell as? NewsPhotoTableViewCell)?.configure(name: groups[0].photo100)
        (cell as? NewsAuthorAndDateTableViewCell)?.configure(author: profiles[0].lastName, date: String(news[0].date))
        (cell as? NewsLikesAndCommentsTableViewCell)?.configure(likes: news[0].likes.count, comments: news[0].comments.count)
        }
}
