//
//  NewsListViewModel.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

class NewsListViewModel {
    
    private var newsNetworkManager : NewsNetworkManager?
    private  var newsArray : [News]? {
        didSet {
            completionHandler?()
        }
    }
    
    var completionHandler : CompletionHandler?
    
    init() {
    }
    
    init(completionHandler : @escaping CompletionHandler) {
        self.completionHandler = completionHandler
        self.newsNetworkManager = NewsNetworkManager()
    }
    
    
    var numberOfNewsArticles : Int {
        guard let newsCount = newsArray?.count else {
            return 0
        }
        return newsCount
    }
    
    func setNewsArray(newsArray : [News]?) {
        self.newsArray = newsArray
    }
    
    func newsArticleAtIndex(index : Int) -> NewsViewModel? {
        return NewsViewModel.init(news: (newsArray?[index])!)
    }
    
    func fetchAllNews() -> Void {
        newsNetworkManager?.fetchTopNews { (result) in
            switch result {
            case .success(let newsList):
                //self.newsArray = newsList.news
                print("success")
                self.setNewsArray(newsArray: newsList.news)
            case .failure(_):
                //self.newsArray = []
                self.setNewsArray(newsArray: [])
            }
        }
    }
}
