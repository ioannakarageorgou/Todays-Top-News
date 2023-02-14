//
//  NewsViewModel.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

struct NewsViewModel {
    
    let news : News?
    
    init(news : News) {
        self.news = news
    }
    
    var  newsTitle : String {
        return news?.title ?? ""
    }
    
    var  newsDescription : String {
        return news?.description ?? ""
    }
}
