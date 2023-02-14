//
//  NewsNetworkManager.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

class NewsNetworkManager {
        
    func fetchTopNews(_ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void {
        let urlStr =  "https://newsapi.org/v2/top-headlines?q=top&from=\(Utilities.getDateString())&sortBy=publishedAt&apiKey=a28b5e512c104bf68fba3eb289522447&pageSize=10"
        return HttpClient.sharedInstance.getResponse(fromURL: urlStr, completion)
    }
}
