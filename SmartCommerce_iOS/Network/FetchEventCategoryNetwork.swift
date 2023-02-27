//
//  FetchEventCategoryNetwork.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/25.
//

import Foundation
import RxSwift

enum FetchEventCategoryError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class FetchEventCategoryNetwork {
    private let session: URLSession
    let api = FetchEventCategoryAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchData() -> Single<Result<EventCategoryCellDTO, FetchEventCategoryError>> {
        guard let url = api.fetchData().url else { return .just(.failure(.invalidURL)) }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        return session.rx.data(request: request as URLRequest)
            .map { responseData in
                do {
                    let eventCategoryData = try JSONDecoder().decode(EventCategoryCellDTO.self, from: responseData)
                    return .success(eventCategoryData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }.catch { _ in
                    .just(.failure(.networkError))
            }.asSingle()
        
    }
}
