//
//  CategoryListViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import RxSwift
import RxCocoa

struct CategoryListViewModel {
    //ViewModel -> View
    let categoryListData: Driver<[String]>
    
    init() {
        let categoryList = [
            "상의",
            "아우터",
            "바지",
            "원피스/스커트",
            "신발",
            "가방",
            "패션 소품",
            "언더웨어",
            "뷰티",
            "스포츠/레저",
            "라이프",
            "키즈",
            "브랜드"
        ]
        
        self.categoryListData = Driver<[String]>.just(categoryList)
    }
}
