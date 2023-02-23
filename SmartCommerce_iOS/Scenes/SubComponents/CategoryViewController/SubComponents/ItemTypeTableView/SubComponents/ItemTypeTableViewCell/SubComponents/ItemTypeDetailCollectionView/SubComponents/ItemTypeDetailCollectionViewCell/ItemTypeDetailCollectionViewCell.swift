//
//  ItemTypeDetailCollectionViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import UIKit
import SnapKit

final class ItemTypeDetailCollectionViewCell: UICollectionViewCell {
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        
        return stackView
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20.0
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "후드 티셔츠"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
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
