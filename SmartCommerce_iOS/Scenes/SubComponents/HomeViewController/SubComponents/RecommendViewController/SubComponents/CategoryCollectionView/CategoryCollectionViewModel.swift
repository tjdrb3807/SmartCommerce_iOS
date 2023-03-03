//
//  CategoryCollectionViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/03.
//

import RxSwift
import RxCocoa

struct CategoryCollectionViewModel {
    // ParentViewModel -> ViewModel
    let categoryCellData = PublishSubject<[EventCategoryCellData]>()
    
    // ViewModel -> View
    let categoryDataList: Driver<[EventCategoryCellData]>
    
    init() {
        self.categoryDataList = categoryCellData
            .asDriver(onErrorJustReturn: [])
    }
    
}
