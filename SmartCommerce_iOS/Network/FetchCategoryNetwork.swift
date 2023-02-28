//
//  FetchCategoryNetwork.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/28.
//

import Foundation
import RxSwift

enum FetchCategoryError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class FetchCategoryNetwork {
    private let session: URLSession
    let api = FetchCategoryAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchCategory() -> Single<Result<CategoryCellDTO, FetchCategoryError>> {
        guard let url = api.fetchCategory().url else { return .just(.failure(.invalidURL)) }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        return session.rx.data(request: request as URLRequest)
            .map { response in
                do {
                    let categoryData = try JSONDecoder().decode(CategoryCellDTO.self, from: response)
                    return .success(categoryData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }.catch { _ in
                    .just(.failure(.networkError))
            }.asSingle()
    }
}
