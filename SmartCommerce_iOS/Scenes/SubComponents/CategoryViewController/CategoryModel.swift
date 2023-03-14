//
//  CategoryModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/27.
//

import RxSwift

struct CategoryModel {
    let fetchCategoryNetwork = FetchCategoryNetwork()
    let fetchItemTypeNetwork = FetchItemTypeNetwork()
    
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
    
    func fetchItemType() -> Single<Result<ItemTypeDTO, FetchItemTypeError>> {
        fetchItemTypeNetwork.fetchItemType()
    }
    
    func getItemTypeValue(_ result: Result<ItemTypeDTO, FetchItemTypeError>) -> ItemTypeDTO? {
        guard case .success(let value) = result else { return nil }
        
        return value
    }
    
    func getItemTypeListCellData(_ value: ItemTypeDTO) -> [ItemTypeData] {
        value.documents
            .sorted { $0.categoryID ?? 0 < $1.categoryID ?? 0 }
            .map { itemTypeDocument in
                let thumbnailURL = URL(string: itemTypeDocument.itemTypeThumbnailURL ?? "" )
                
                return ItemTypeData(itemTypeID: itemTypeDocument.itemTypeID,
                                    categoryID: itemTypeDocument.categoryID,
                                    itemTypeTitle: itemTypeDocument.itemTypeTitle,
                                    itemTypeThumbnailURL: thumbnailURL)
            }
    }
    
    func sortItemTypeByCategory(_ data: [ItemTypeData]) -> [ItemTypeSection] {
        var sortDataList: [ItemTypeSection] = []
        var categoryId: Int = (data.first?.categoryID)!
        var index = 0
        
        sortDataList.append(ItemTypeSection(categoryId: categoryId, items: [ItemTypeData]()))
        
        for itemType in data {
            if sortDataList[index].categoryId == itemType.categoryID {
                sortDataList[index].items.append(itemType)
            } else {
                categoryId = itemType.categoryID!
                index += 1
                
                sortDataList.append(ItemTypeSection(categoryId: categoryId, items: [ItemTypeData]()))
                sortDataList[index].items.append(itemType)
            }
        }
        
        return sortDataList
    }
}

