//
//  CategoryCollectionViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit
import Kingfisher
import SwiftUI

final class CategoryCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20.0
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15.0)
        
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
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        
        addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [imageView, titleLabel].forEach { verticalStackView.addArrangedSubview($0) }
    }

    func setData(_ data: EventCategoryCellData) {
        imageView.kf.setImage(with: data.thumbnailURL)
        titleLabel.text = data.title
    }
}

struct CategoryCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CategoryCollectionViewCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
