//
//  NewsList.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

struct NewsList : Codable {
    
    var news : [News]
    
    private enum CodingKeys: String, CodingKey {
        case news = "articles"
    }
}
