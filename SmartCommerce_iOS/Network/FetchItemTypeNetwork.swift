//
//  FetchItemTypeNetwork.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/06.
//

import Foundation
import RxSwift

enum FetchItemTypeError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class FetchItemTypeNetwork {
    private let session: URLSession
    let api = FetchItemTypeAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchItemType() -> Single<Result<ItemTypeDTO, FetchItemTypeError>> {
        guard let url = api.fetchItemType().url else { return .just(.failure(.invalidURL)) }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        return session.rx.data(request: request as URLRequest)
            .map { response in
                do {
                    let itemTypeData = try JSONDecoder().decode(ItemTypeDTO.self, from: response)
                    
                    return .success(itemTypeData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }.catch { _ in
                    .just(.failure(.networkError))
            }.asSingle()
    }
}
