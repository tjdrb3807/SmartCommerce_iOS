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
    }
}
