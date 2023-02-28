//
//  EventCategoryListViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit
import SwiftUI
import Kingfisher

final class EventCategoryListViewCell: UICollectionViewCell {
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5.0
        
        return stackView
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "골프"
        label.font = .systemFont(ofSize: 14.0, weight: .light)
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    func setData(_ data: EventCategoryCellData) {
        self.thumbnailImageView.kf.setImage(with: data.thumbnailURL)
        self.titleLabel.text = data.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout() {
        addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        [thumbnailImageView, titleLabel].forEach { verticalStackView.addArrangedSubview($0) }
    }
}
