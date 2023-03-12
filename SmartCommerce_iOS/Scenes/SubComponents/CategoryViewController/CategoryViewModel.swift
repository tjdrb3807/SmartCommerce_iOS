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
    
    // View -> ViewModel
    let categoryViewWillAppear = PublishRelay<Void>()
    
    init(model: CategoryModel = CategoryModel()) {
        let categoryResult = categoryViewWillAppear
            .withLatestFrom(model.fetchCategory())
            .share()
        
        let categoryValue = categoryResult
            .compactMap(model.getCategoryValue(_:))
        
        let categoryListCellData = categoryValue
            .map(model.getCategoryListCellData(_:))
        
        categoryListCellData
            .bind(to: categoryListViewModel.categoryCellData)
            .disposed(by: disposeBag)
        
        let itemTypeResult = categoryViewWillAppear
            .withLatestFrom(model.fetchItemType())
            .share()
        
        let itemTypeValue = itemTypeResult
            .compactMap(model.getItemTypeValue(_:))
        
        let itemTypeListCellData = itemTypeValue
            .map(model.getItemTypeListCellData(_:))
        
        let sortItemTypeListData = itemTypeListCellData
            .map(model.getSoryItemTypeDataListByCategory(_:))
    }
}
