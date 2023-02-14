//
//  ViewController.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var newsTableView : UITableView!
    
    private lazy var newsListViewModel : NewsListViewModel = {
        return NewsListViewModel(completionHandler: reloadNewsTableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Today's Top News"
//        newsTableView.isAccessibilityElement = true
//        newsTableView.accessibilityIdentifier = "NewsTableView"
        newsListViewModel.fetchAllNews()
    }

    func reloadNewsTableView() -> Void {
        print("reloadNewsTableView")
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var thumbnailImageView : UIImageView!
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListViewModel.numberOfNewsArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.isAccessibilityElement = true
        cell.accessibilityIdentifier = "NewsTableViewCell_\(indexPath.section)_\(indexPath.row)"
        let newsArticle = newsListViewModel.newsArticleAtIndex(index: indexPath.row)
        cell.titleLabel.text = newsArticle?.newsTitle
        cell.descriptionLabel.text = newsArticle?.newsTitle
        if let imageURL = newsArticle?.news?.urlToImage, let url = URL(string: imageURL) {
            cell.thumbnailImageView.load(url: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
