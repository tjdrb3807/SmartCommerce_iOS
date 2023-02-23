//
//  ItemTypeTableViewCell.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import UIKit
import SnapKit
import SwiftUI

final class ItemTypeTableViewCell: UITableViewCell {
    private lazy var detailCollectionView: UIView = {
        let collectionView = ItemTypeDetailCollectionView()
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(detailCollectionView)
        detailCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10.0)
            $0.trailing.equalToSuperview().inset(10.0)
            $0.bottom.equalToSuperview()
        }
    }
}

struct ItemTypeTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            ItemTypeTableViewCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}



