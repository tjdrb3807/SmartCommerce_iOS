//
//  BannerPageModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import RxSwift

struct BannerPageModel {
    let fetchBannerPageNetwork = FetchBannerPageNetwork()
    
    func fetchBannerPage() -> Single<Result<BannerPageDTO, FetchBannerPageError>> {
        fetchBannerPageNetwork.fetchBannerPage()
    }
    
    func getBannerPageValue(_ result: Result<BannerPageDTO, FetchBannerPageError>) -> BannerPageDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getBannserPageList(_ value: BannerPageDTO) -> [BannerPageData] {
        value.bannerList
            .map { banner in
                let thumbnailURL = URL(string: banner.thumbnailURL ?? "" )

                return BannerPageData(content: banner.content, thumbnailURL: thumbnailURL)
            }
    }
}
