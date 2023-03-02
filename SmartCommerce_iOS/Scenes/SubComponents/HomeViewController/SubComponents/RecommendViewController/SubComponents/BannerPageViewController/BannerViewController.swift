//
//  BannerViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/01.
//

import UIKit
import SnapKit
import Kingfisher

final class BannerViewController: UIViewController {
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setData(_ data: BannerPageData) {
        self.thumbnailImageView.kf.setImage(with: data.thumbnailURL)
    }
}
