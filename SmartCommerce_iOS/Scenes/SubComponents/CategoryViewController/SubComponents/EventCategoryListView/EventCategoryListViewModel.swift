//
//  EventCategoryListViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import RxSwift
import RxCocoa

struct EventCategoryListViewModel {
    let disposeBag = DisposeBag()
    
    //ViewModel -> View
    let eventCategories: Driver<[EventCategoryData]>
    
    init() {
        let eventCategoryDataList = [
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/images/goods_img/20230102/3002829/3002829_16726343803772_500.jpg"), title: "뷰티"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/mfile_s01/_lookbook/list63f2d10b7f7ec"), title: "럭셔리"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/images/goods_img/20220921/2806759/2806759_2_220.jpg"), title: "어스"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/mfile_s01/_lookbook/list63f2fe3edbdb2"), title: "스포츠"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/mfile_s01/2023/02/16/thumb.163edc4dbcb3f6.jpg.0"), title: "아울렛"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/images/brand_event/2023021515283300000016310.jpg"), title: "골프"),
            EventCategoryData(thumbnailImageURL: URL(string: "https://image.msscdn.net/images/brand_event/2023021715431800000074564.jpg"), title: "키즈")
        ]
        
        self.eventCategories = Driver<[EventCategoryData]>.just(eventCategoryDataList)
    }
}
