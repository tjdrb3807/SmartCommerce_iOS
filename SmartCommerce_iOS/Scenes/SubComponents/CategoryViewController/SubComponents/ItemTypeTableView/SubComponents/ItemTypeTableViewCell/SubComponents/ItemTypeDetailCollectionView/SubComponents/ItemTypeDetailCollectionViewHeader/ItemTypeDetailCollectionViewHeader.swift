//
//  ItemTypeDetailCollectionViewHeader.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import UIKit
import SnapKit

final class ItemTypeDetailCollectionViewHeader: UICollectionReusableView {
    private lazy var categoryTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("상의", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.sizeToFit()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(categoryTitleButton)
        categoryTitleButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    }
}
