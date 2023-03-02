//
//  BannerCollectionViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/02.
//

import UIKit
import SnapKit
import Kingfisher

final class BannerCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func setData(_ data: BannerPageData) {
        
        imageView.kf.setImage(with: data.thumbnailURL)
    }
}
