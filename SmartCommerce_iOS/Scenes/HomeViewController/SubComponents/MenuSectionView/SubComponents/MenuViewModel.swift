//
//  MenuViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import RxSwift
import RxCocoa

struct MenuViewModel {
    let disposeBag = DisposeBag()
    
    // View -> ViewModel
    let menuButtonTapped = PublishRelay<Void>()
    
    // ViewModel -> ParentViewModel
    
    init() {
        
    }
}
