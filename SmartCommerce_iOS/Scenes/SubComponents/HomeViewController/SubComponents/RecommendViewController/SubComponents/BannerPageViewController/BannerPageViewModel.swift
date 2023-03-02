//
//  BannerPageViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import RxSwift
import RxCocoa

struct BannerPageViewModel {
    // View -> ViewModel
    let bannerPageViewWillAppear = PublishRelay<Void>()
    
    // ViewModel -> View
    let bannerPageList: Driver<[BannerPageData]>
    
    init(model: BannerPageModel = BannerPageModel()) {
        let bannerPageResult = bannerPageViewWillAppear
            .withLatestFrom(model.fetchBannerPage())
            .share()
        
        let bannerPageValue = bannerPageResult
            .compactMap(model.getBannerPageValue(_:))
        
        let bannerPageListData = bannerPageValue
            .map(model.getBannserPageList(_:))
        
        self.bannerPageList = bannerPageListData
            .asDriver(onErrorJustReturn: [])
    }
}
