//
//  ItemTypeCollectionViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/13.
//

import UIKit
import SnapKit
import Kingfisher

final class ItemTypeCollectionViewCell: UICollectionViewCell {
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [thumbnailImageView, titleLabel].forEach { contentView.addSubview($0) }
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(thumbnailImageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setData(_ data: ItemTypeData) {
        self.thumbnailImageView.kf.setImage(with: data.itemTypeThumbnailURL)
        self.titleLabel.text = data.itemTypeTitle
    }
}
