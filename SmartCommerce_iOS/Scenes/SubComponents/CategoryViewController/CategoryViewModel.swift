//
//  CategoryViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import RxSwift
import RxCocoa

struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    // SubComponents
    let eventCategoryListViewModel = EventCategoryListViewModel()
    let categoryListViewModel = CategoryListViewModel()
    let itemTypeCollectionViewModel = ItemTypeCollectionViewModel()
    
    // View -> ViewModel
    let categoryViewWillAppear = PublishRelay<Void>()
    
    init(model: CategoryModel = CategoryModel()) {
        // Fetch Category Data
        let categoryResult = categoryViewWillAppear
            .withLatestFrom(model.fetchCategory())
            .share()
        
        let categoryValue = categoryResult
            .compactMap(model.getCategoryValue(_:))
        
        let categoryListCellData = categoryValue
            .map(model.getCategoryListCellData(_:))
        
        categoryListCellData
            .bind(to: self.categoryListViewModel.categoryCellData)
            .disposed(by: disposeBag)
        
        // Fetch ItemType Data
        let itemTypeResult = categoryViewWillAppear
            .withLatestFrom(model.fetchItemType())
            .share()

        let itemTypeValue = itemTypeResult
            .compactMap(model.getItemTypeValue)

        let itemTypeListCellData = itemTypeValue
            .map(model.getItemTypeListCellData)
        
        let itemTypeSection = itemTypeListCellData
            .map(model.sortItemTypeByCategory)
        
        itemTypeSection
            .bind(to: self.itemTypeCollectionViewModel.itemTypeDataList)
            .disposed(by: disposeBag)
    }
}
