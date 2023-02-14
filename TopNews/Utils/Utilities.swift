//
//  Utilities.swift
//  TopNews
//
//  Created by Ioanna Karageorgou on 14/2/23.
//

import Foundation

typealias CompletionHandler = (()->Void)

struct Utilities {
    
    static func getDateString() -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: Date())
    }
}
