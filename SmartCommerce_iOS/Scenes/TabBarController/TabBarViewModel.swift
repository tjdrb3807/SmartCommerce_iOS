//
//  TabBarViewModel.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import RxSwift
import RxCocoa

struct TabBarViewModel {
    // Sub Components
    let homeViewModel = HomeViewModel()
    let categoryViewModel = CategoryViewModel()
    
    init() {
        
    }
}
