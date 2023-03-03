//
//  CategoryCollectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit
import SwiftUI
import RxSwift
import RxCocoa

final class CategoryCollectionView: UICollectionView {
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        delegate = self
        
        self.attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryCollectionViewModel) {
        viewModel.categoryDataList
            .drive(self.rx.items) { collectionView, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: index) as! CategoryCollectionViewCell
                
                cell.setData(data)
                
                return cell
            }.disposed(by: disposeBag)
    }
    
    private func attribute() {
        backgroundColor = .systemBackground
        
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let value: CGFloat = collectionView.frame.width / 6
        
        return CGSize(width: value, height: value + 18.0)
    }
}

struct CategortCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }

    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CategoryCollectionView()
        }

        func updateUIView(_ uiView: UIView, context: Context) {}

        typealias UIViewType = UIView
    }
}
