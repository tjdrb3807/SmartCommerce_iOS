//
//  EventCategoryListModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/03.
//

import RxSwift

struct EventCategoryListModel {
    let fetchEventCategoryNetwork = FetchEventCategoryNetwork()
    
    func getEventCategoryListCellData(_ value: EventCategoryDTO) -> [EventCategoryCellData] {
        value.documents
            .map { eventCategoryDocument in
                let thumbnailURL = URL(string: eventCategoryDocument.thumbnailURL ?? "")
                
                return EventCategoryCellData(title: eventCategoryDocument.title, thumbnailURL: thumbnailURL)
            }
    }
}
