//
//  HeaderSectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI
import SnapKit

final class HeaderSectionView: UIView {
    let disposeBag = DisposeBag()
    
    private lazy var alarmButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .thin)
        let image = UIImage(systemName: "bell", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MUSINSA"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25.0, weight: .medium)
        
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .thin)
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    private lazy var shoopingBasketButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .thin)
        let image = UIImage(systemName: "bag", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: HeaderSectionViewModel) {
        
    }
    
    private func layout() {
        [alarmButton, titleLabel, searchButton, shoopingBasketButton].forEach { addSubview($0) }
        
        alarmButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(shoopingBasketButton.snp.leading).offset(-5.0)
        }
        
        shoopingBasketButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            HeaderSectionView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
