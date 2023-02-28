//
//  CategoryListViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit

final class CategoryListViewCell: UITableViewCell {
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .light)
        label.text = "상의"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: CategoryCellData) {
        titleLable.text = data.title
    }
    
    private func layout() {
        addSubview(titleLable)
        
        titleLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12.0)
        }
    }
}
