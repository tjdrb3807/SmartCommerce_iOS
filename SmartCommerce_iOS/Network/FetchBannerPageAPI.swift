//
//  FetchBannerPageAPI.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import Foundation

struct FetchBannerPageAPI {
    static let scheme = "http"
    static let path = "/localhost:8080/commerce/api/v1/home/eventBanner"
    
    func fetchBannerPage() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = FetchBannerPageAPI.scheme
        components.path = FetchBannerPageAPI.path
        
        return components
    }
}
