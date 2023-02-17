//
//  MenuSectionViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import Foundation
import RxSwift
import RxCocoa

struct MenuSectionViewModel {
    let disposeBag = DisposeBag()
    let menuViewModel = MenuViewModel()
    
    // ViewModel -> View
    let menuData: Driver<[MenuData]>
    
    // 
    
    init() {
        let menuDataList = [
            MenuData(id: 0, title: "추천"),
            MenuData(id: 1, title: "랭킹"),
            MenuData(id: 2, title: "스타일"),
            MenuData(id: 3, title: "세일"),
            MenuData(id: 4, title: "이벤트"),
        ]
        
        self.menuData = Driver.just(menuDataList)
    }
}
