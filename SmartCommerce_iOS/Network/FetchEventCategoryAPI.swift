//
//  FetchEventCategoryAPI.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import Foundation

struct FetchEventCategoryAPI {
    static let scheme = "http"
    static let path = "/localhost:8080/commerce/api/v1/event/category"
    
    func fetchEventCategory() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = FetchEventCategoryAPI.scheme
        components.path = FetchEventCategoryAPI.path
        
        return components
    }
}
