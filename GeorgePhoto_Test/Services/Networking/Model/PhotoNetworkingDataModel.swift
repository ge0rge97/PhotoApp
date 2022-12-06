//
//  PhotoNetworkingDataModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 01.12.2022.
//

import Foundation

struct PhotoNetworkingDataModel: Codable {
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Result: Codable {
    let id: String?
    let likes: Int?
    
    let user: User?
    let urls: Urls?
    
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case user
        case likes
        case urls
        case createdAt = "created_at"
    }
}

struct User: Codable {
    let username: String?

    enum CodingKeys: String, CodingKey {
        case username
    }
}

struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb: String?
}

//MARK: - Formatted Date
extension Result {
    
    var createdDate: Date? {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: createdAt ?? "")
    }
}
