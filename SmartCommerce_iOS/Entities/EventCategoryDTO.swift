//
//  EventCategoryDTO.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import Foundation

struct EventCategoryDTO: Decodable {
    let documents: [EventCategoryDocument]
}

struct EventCategoryDocument: Decodable {
    let title: String?
    let thumbnailURL: String?
    let thumbanilTextURL: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "event_title"
        case thumbnailURL = "thumbnail_image_url"
        case thumbanilTextURL = "thumbnail_text_image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try? values.decode(String?.self, forKey: .title)
        self.thumbnailURL = try? values.decode(String?.self, forKey: .thumbnailURL)
        self.thumbanilTextURL = try? values.decode(String?.self, forKey: .thumbanilTextURL)
    }
}
