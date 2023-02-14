//
//  News.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

struct News : Codable {
    
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
}
