//
//  MenuButtonSectionViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import Foundation
import RxSwift
import RxCocoa

struct MenuButtonSectionViewModel {
    let disposeBag = DisposeBag()
    
    // ViewModel -> View
    let menuDataList: Driver<[MenuData]>
    let selectedMenu: Driver<Int>
    
    // View -> ViewModel
    let menuButtonTapped = PublishRelay<Int>()
    
    
    init() {
        let menuDataList = [
            MenuData(id: 0, title: "추천"),
            MenuData(id: 1, title: "랭킹"),
            MenuData(id: 2, title: "스타일"),
            MenuData(id: 3, title: "세일"),
            MenuData(id: 4, title: "이벤트")
        ]
        
        self.menuDataList = Driver.just(menuDataList)
        
        self.selectedMenu = menuButtonTapped
            .asDriver(onErrorJustReturn: 0)
            .startWith(0)
    }
}
