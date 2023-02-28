//
//  CategoryModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/27.
//

import RxSwift

struct CategoryModel {
    let fetchEventCategoryNetwork = FetchEventCategoryNetwork()
    
    func fetchEventCategory() -> Single<Result<EventCategoryDTO, FetchEventCategoryError>> {
        fetchEventCategoryNetwork.fetchEventCategory()
    }
    
    func getEventCategoryValue(_ result: Result<EventCategoryDTO, FetchEventCategoryError>) -> EventCategoryDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getEventCategoryListCellData(_ value: EventCategoryDTO) -> [EventCategoryCellData] {
        value.documents
            .map { eventCategoryDocument in
                let thumbnailURL = URL(string: eventCategoryDocument.thumbnailURL ?? "")
                
                return EventCategoryCellData(title: eventCategoryDocument.title, thumbnailURL: thumbnailURL)
            }
    }
}

