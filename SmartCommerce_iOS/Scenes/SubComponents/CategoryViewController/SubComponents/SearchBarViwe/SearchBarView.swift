//
//  SearchBarView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SwiftUI
import SnapKit

final class SearchBarView: UISearchBar {
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
        
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        setImage(UIImage(), for: UISearchBar.Icon.search, state: .normal)
        placeholder = "잠시 후 8시! 마크 곤잘레스 라이브"
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
    private func layout() {
        addSubview(shoopingBasketButton)
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.0)
            $0.trailing.equalTo(shoopingBasketButton.snp.leading).offset(-12.0)
            $0.centerY.equalToSuperview()
        }
        
        shoopingBasketButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12.0)
            $0.centerY.equalToSuperview()
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            SearchBarView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
