//
//  FetchBannerPageNetwork.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import Foundation
import RxSwift

enum FetchBannerPageError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class FetchBannerPageNetwork {
    private let session: URLSession
    let api = FetchBannerPageAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchBannerPage() -> Single<Result<BannerPageDTO, FetchBannerPageError>> {
        guard let url = api.fetchBannerPage().url else { return .just(.failure(.invalidURL)) }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        return session.rx.data(request: request as URLRequest)
            .map { response in
                do {
                    let bannerData = try JSONDecoder().decode(BannerPageDTO.self, from: response)
                    
                    return .success(bannerData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }.catch { _ in
                    .just(.failure(.networkError))
            }.asSingle()
    }
}
