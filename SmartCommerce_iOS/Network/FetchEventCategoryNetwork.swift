//
//  FetchEventCategoryNetwork.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
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
    
    func fetchEventCategory() -> Single<Result<EventCategoryDTO, FetchEventCategoryError>> {
        guard let url = api.fetchEventCategory().url else { return .just(.failure(.invalidURL)) }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        return session.rx.data(request: request as URLRequest)
            .map { response in
                do {
                    let eventCategoryData = try JSONDecoder().decode(EventCategoryDTO.self, from: response)
                    return .success(eventCategoryData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }.catch { _ in
                    .just(.failure(.networkError))
            }.asSingle()
    }
}
