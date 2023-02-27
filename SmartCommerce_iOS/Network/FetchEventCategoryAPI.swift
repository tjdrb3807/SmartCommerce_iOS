//
//  FetchEventCategoryAPI.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/25.
//

import Foundation

struct FetchEventCategoryAPI {
    static let scheme = "http"
//    static let host = "localhost:8080"
    static let path = "/localhost:8080/commerce/api/v1/eventIcon"
    
    func fetchData() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = FetchEventCategoryAPI.scheme
//        components.host = FetchEventCategoryAPI.host
        components.path = FetchEventCategoryAPI.path
        
        return components
    }
}
