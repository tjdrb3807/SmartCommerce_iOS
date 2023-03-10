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
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        
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
        [imageView, contentLabel].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        contentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func setData(_ data: BannerPageData) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.imageView.kf.setImage(with: data.thumbnailURL)
            self.contentLabel.text = data.content
        }
    }
}
