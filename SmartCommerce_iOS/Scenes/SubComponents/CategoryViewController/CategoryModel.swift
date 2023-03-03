//
//  CategoryModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/27.
//

import RxSwift

struct CategoryModel {
    let fetchCategoryNetwork = FetchCategoryNetwork()
    
    func fetchCategory() -> Single<Result<CategoryCellDTO, FetchCategoryError>> {
        fetchCategoryNetwork.fetchCategory()
    }
    
    func getCategoryValue(_ result: Result<CategoryCellDTO, FetchCategoryError>) -> CategoryCellDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getCategoryListCellData(_ value: CategoryCellDTO) -> [CategoryCellData] {
        value.documents
            .map { categoryDocument in
                return CategoryCellData(title: categoryDocument.title)
            }
    }
}

