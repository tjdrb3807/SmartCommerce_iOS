//
//  EventCategoryListViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import RxSwift
import RxCocoa

struct EventCategoryListViewModel {
    let disposeBag = DisposeBag()
    
    // ParentViewModel -> ViewModel
    let eventCategoryCellData = PublishSubject<[EventCategoryCellData]>()
    
    init() {
        
    }
}
