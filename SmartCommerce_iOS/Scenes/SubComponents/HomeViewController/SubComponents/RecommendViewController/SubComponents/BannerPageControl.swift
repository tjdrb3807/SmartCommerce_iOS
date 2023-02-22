//
//  BannerPageControl.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/21.
//

import UIKit
import SnapKit

final class BannerPageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        
        backgroundColor = .black
        alpha = 0.7
    
        self.numberOfPages = 3
        
        self.currentPage = 1
    }
    
}
