//
//  BannerPageDTO.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import Foundation

struct BannerPageDTO: Decodable {
    let bannerList: [Banner]
}

struct Banner: Decodable {
    let id: Int?
    let content: String?
    let thumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "event_banner_id"
        case content = "event_content"
        case thumbnailURL = "thumbnail_image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? values.decode(Int?.self, forKey: .id)
        self.content = try? values.decode(String?.self, forKey: .content)
        self.thumbnailURL = try? values.decode(String?.self, forKey: .thumbnailURL)
    }
    
}
