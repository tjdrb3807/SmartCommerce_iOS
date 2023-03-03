//
//  RecommendViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import RxSwift
import RxCocoa

struct RecommendViewModel {
    let disposeBag = DisposeBag()
    
    // SubComponent
    let bannerCollectionViewModel = BannerCollectionViewModel()
    let categoryCollectionViewModel = CategoryCollectionViewModel()
    
    // ViewModel -> View
    let recommendViewWillAppear = PublishRelay<Void>()
    
    // ViewModel -> Parent ViewModel
    let eventCategoryValueList = PublishRelay<EventCategoryDTO>()
    
    init(model: RecommendModel = RecommendModel()) {
        let bannerPageResult = recommendViewWillAppear
            .withLatestFrom(model.fetchBannerPage())
            .share()
        
        let bannerPageValue = bannerPageResult
            .compactMap(model.getBannerPageValue(_:))
        
        bannerPageValue
            .map(model.getBannerPageList(_:))
            .bind(to: bannerCollectionViewModel.bannerPageData)
            .disposed(by: disposeBag)
        
        let evnetCategoryResult = recommendViewWillAppear
            .withLatestFrom(model.fetchEventCategory())
            .share()
        
        let evnetCategoryValue = evnetCategoryResult
            .compactMap(model.getEventCategoryValue(_:))
        
        evnetCategoryValue
            .map(model.getEventCategroyList(_:))
            .bind(to: categoryCollectionViewModel.categoryCellData)
            .disposed(by: disposeBag)
        
        evnetCategoryValue
            .bind(to: self.eventCategoryValueList)
            .disposed(by: disposeBag)
    }
}

