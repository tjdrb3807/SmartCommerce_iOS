//
//  CategoryListViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import RxSwift
import RxCocoa

struct CategoryListViewModel {
    
    // Parent ViewModel -> ViewModel
    let categoryCellData = PublishSubject<[CategoryCellData]>()
    let currentCateogryId = PublishSubject<Int>()
    
    // ViewModel -> View
    let cellData: Driver<[CategoryCellData]>
    let categoryId: Driver<Int>
    
    init() {
        self.cellData = categoryCellData
            .asDriver(onErrorJustReturn: [])
        
        self.categoryId = currentCateogryId
            .asDriver(onErrorJustReturn: 0)
    }
}
