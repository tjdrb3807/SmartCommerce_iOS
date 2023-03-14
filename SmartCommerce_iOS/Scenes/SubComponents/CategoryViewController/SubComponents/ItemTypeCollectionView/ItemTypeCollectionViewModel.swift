//
//  ItemTypeCollectionViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/13.
//

import RxSwift
import RxCocoa

struct ItemTypeCollectionViewModel {
    // Parent ViewModel -> View
    let itemTypeDataList = PublishSubject<[ItemTypeSection]>()
    
    // ViewModel -> View
    let cellData: Driver<[ItemTypeSection]>
    
    // View -> ViewModel
    let currentCategoryId = PublishRelay<Int>()
    
    init() {
        self.cellData = itemTypeDataList
            .asDriver(onErrorJustReturn: [])
    }
}
