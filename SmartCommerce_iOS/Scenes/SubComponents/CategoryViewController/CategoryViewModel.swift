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
    let itemTypeTableViewModel = ItemTypeTableViewModel()
    
    // View -> ViewModel
    let categoryViewWillAppear = PublishRelay<Void>()
    
    init(model: CategoryModel = CategoryModel()) {
        
        // Fetch EventCategory List
        let eventCategoryResult = categoryViewWillAppear
            .withLatestFrom(model.fetchEventCategory())
            .share()
        
        let eventCategoryValue = eventCategoryResult
            .compactMap(model.getEventCategoryValue(_:))
        
        let eventCategoryListCellData = eventCategoryValue
            .map(model.getEventCategoryListCellData(_:))
        
        eventCategoryListCellData
            .bind(to: eventCategoryListViewModel.eventCategoryCellData)
            .disposed(by: disposeBag)
        
        // Fetch Category List
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
    }
}
