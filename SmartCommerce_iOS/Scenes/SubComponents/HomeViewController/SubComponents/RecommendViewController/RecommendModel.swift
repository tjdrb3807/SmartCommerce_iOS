//
//  RecommendModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/02.
//

import RxSwift

struct RecommendModel {
    let fetchBannerPageNetwork = FetchBannerPageNetwork()
    let fetchEventCategoryNetwork = FetchEventCategoryNetwork()
    
    func fetchBannerPage() -> Single<Result<BannerPageDTO, FetchBannerPageError>> {
        fetchBannerPageNetwork.fetchBannerPage()
    }
    
    func getBannerPageValue(_ result: Result<BannerPageDTO, FetchBannerPageError>) -> BannerPageDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getBannerPageList(_ value: BannerPageDTO) -> [BannerPageData] {
        value.bannerList
            .map { banner in
                let thumbnailURL = URL(string: banner.thumbnailURL ?? "")
                
                return BannerPageData(content: banner.content, thumbnailURL: thumbnailURL)
            }
    }
    
    func fetchEventCategory() -> Single<Result<EventCategoryDTO, FetchEventCategoryError>> {
        fetchEventCategoryNetwork.fetchEventCategory()
    }
    
    func getEventCategoryValue(_ result: Result<EventCategoryDTO, FetchEventCategoryError>) -> EventCategoryDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getEventCategroyList(_ value: EventCategoryDTO) -> [EventCategoryCellData] {
        value.documents
            .map { eventCategory in
                let thumbnailURL = URL(string: eventCategory.thumbanilTextURL ?? "")
                
                return EventCategoryCellData(title: eventCategory.title, thumbnailURL: thumbnailURL)
            }
    }
}
