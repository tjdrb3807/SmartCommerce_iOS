//
//  HomeViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/17.
//

import RxSwift
import RxCocoa

struct HomeViewModel {
    let disposeBag = DisposeBag()
    
    // SubComponents
    let menuButtonSectionViewModel = MenuButtonSectionViewModel()
    let recommendViewModel = RecommendViewModel()
    
    // ViewModel -> View
    let selectedMenu: Driver<Int>
    
    init() {
        let selectedMenuIndex = menuButtonSectionViewModel.selectedMenu
            .map { $0.id }
            .startWith(0)
        
        self.selectedMenu = selectedMenuIndex
            .asDriver(onErrorJustReturn: 0)
    }
}
