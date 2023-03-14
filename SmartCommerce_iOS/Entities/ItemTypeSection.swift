//
//  ItemTypeSection.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/06.
//

import Foundation
import RxDataSources

struct ItemTypeSection {
    var categoryId: Int
    var items: [ItemTypeData]
}

extension ItemTypeSection: SectionModelType {
    typealias Item = ItemTypeData
    
    init(original: ItemTypeSection, items: [Item]) {
        self = original
        self.items = items
    }
}
