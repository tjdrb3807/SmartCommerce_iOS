//
//  BannerCollectionViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/02.
//

import RxSwift
import RxCocoa

struct BannerCollectionViewModel {
    // ParentViewModel -> Model
    let bannerPageData = PublishRelay<[BannerPageData]>()
    
    // ViewModel -> View
    let bannerPageDataList: Driver<[BannerPageData]>
    
    init() {
        self.bannerPageDataList = bannerPageData
            .asDriver(onErrorJustReturn: [])
    }
}
