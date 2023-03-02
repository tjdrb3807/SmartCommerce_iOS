//
//  RecommendViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import RxSwift
import RxCocoa

struct RecommendViewModel {
    // SubComponent
    let bannerCollectionViewModel = BannerCollectionViewModel()
    
    // ViewModel -> View
    let recommendViewWillAppear = PublishRelay<Void>()
    
    init(model: RecommendModel = RecommendModel()) {
        let bannerPageResult = recommendViewWillAppear
            .withLatestFrom(model.fetchBannerPage())
            .share()
        
        let bannerPageValue = bannerPageResult
            .compactMap(model.getBannerPageValue(_:))
        
        let bannerPageData = bannerPageValue
            .map(model.getBannerPageList(_:))
            .bind(to: bannerCollectionViewModel.bannerPageData)
    }
}

