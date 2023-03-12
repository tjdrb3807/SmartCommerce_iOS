//
//  FetchItemTypeAPI.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/06.
//

import Foundation

struct FetchItemTypeAPI {
    static let scheme = "http"
    static let path = "/localhost:8080/commerce/api/v1/itemType"
    
    func fetchItemType() -> URLComponents {
        var compnents = URLComponents()
        
        compnents.scheme = FetchItemTypeAPI.scheme
        compnents.path = FetchItemTypeAPI.path
        
        return compnents
    }
}
