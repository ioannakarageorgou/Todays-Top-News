//
//  TestNewsNetworkManager.swift
//  TopNewsTests
//
//  Created by Ioanna Karageorgou on 15/2/23.
//

import Foundation
@testable import TopNews

enum TestNewsNetworkManagerType {
    case successResponse
    case errorResponse
}

class TestNewsNetworkManager {
    
    var testNewsNetworkManagerType: TestNewsNetworkManagerType = TestNewsNetworkManagerType.errorResponse
    
    func fetchTopNews(_ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void {
        
        var urlStr : URL?
        if testNewsNetworkManagerType == .successResponse {
            urlStr = Bundle.main.url(forResource: "TopNews", withExtension: "json")!
        } else {
            urlStr = Bundle.main.url(forResource: "EmptyResponse", withExtension: "json")!
        }
        
        let urlSession = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: urlStr!) { (data, response, error) in
            guard let data =  data, error == nil else {
                completion(.failure(.badResponse))
                return
            }
            
            do {
                let newsArray = try JSONDecoder().decode(NewsList.self, from: data)
                completion(.success(newsArray))
                return
            } catch {
                completion(.failure(.badFormat))
                return
            }
        }
        task.resume()
    }
}
