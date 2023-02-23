//
//  ItemTypeCollectionViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import UIKit
import SnapKit
import SwiftUI

final class ItemTypeCollectionViewCell: UICollectionViewCell {
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        
        return stackView
    }()
    
    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 20.0
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "후드 티셔츠 / 맨투맨"
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        
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

struct ItemTypeCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            ItemTypeCollectionViewCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}


