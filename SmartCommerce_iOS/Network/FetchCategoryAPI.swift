//
//  FetchCategoryAPI.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import Foundation

struct FetchCategoryAPI {
    static let scheme = "http"
    static let paht = "/localhost:8080/commerce/api/v1/category"
    
    func fetchCategory() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = FetchCategoryAPI.scheme
        components.path = FetchCategoryAPI.paht
        
        return components
    }
}
