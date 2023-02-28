//
//  CategoryCellDTO.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import Foundation

struct CategoryCellDTO: Decodable {
    let documents: [CategoryDocument]
}


struct CategoryDocument: Decodable {
    let id: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "category_id"
        case title = "category_title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? values.decode(Int?.self, forKey: .id)
        self.title = try? values.decode(String?.self, forKey: .title)
    }
}
