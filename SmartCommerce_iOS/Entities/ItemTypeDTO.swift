//
//  ItemTypeDTO.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/06.
//

import Foundation

struct ItemTypeDTO: Decodable {
    let documents: [ItemTypeDocument]
}

struct ItemTypeDocument: Decodable {
    let itemTypeID: Int?
    let categoryID: Int?
    let itemTypeTitle: String?
    let itemTypeThumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        case itemTypeID = "id"
        case categoryID = "category_id"
        case itemTypeTitle = "item_type_title"
        case itemTypeThumbnailURL = "item_type_thumbnail_image_URL"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemTypeID = try? values.decode(Int?.self, forKey: .itemTypeID)
        self.categoryID = try? values.decode(Int?.self, forKey: .categoryID)
        self.itemTypeTitle = try? values.decode(String?.self, forKey: .itemTypeTitle)
        self.itemTypeThumbnailURL = try? values.decode(String?.self, forKey: .itemTypeThumbnailURL)
    }
}
