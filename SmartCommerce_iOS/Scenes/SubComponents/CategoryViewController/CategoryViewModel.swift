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

    
    init(model: CategoryModel = CategoryModel()) {
        
            
    }
}
