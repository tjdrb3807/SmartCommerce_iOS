//
//  EventCategoryCellDTO.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/27.
//

import Foundation

struct EventCategoryCellDTO: Decodable {
    let documents: [EventCategoryCellDocument]
}

struct EventCategoryCellDocument: Decodable {
    let id: Int?
    let title: String?
    let thumbnailImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "event_title"
        case thumbnailImageURL = "thumbnail_image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? values.decode(Int?.self, forKey: .id)
        self.title = try? values.decode(String?.self, forKey: .title)
        self.thumbnailImageURL = try? values.decode(String?.self, forKey: .thumbnailImageURL)
    }
}
