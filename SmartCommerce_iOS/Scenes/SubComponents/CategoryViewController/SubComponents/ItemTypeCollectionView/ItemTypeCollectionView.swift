//
//  ItemTypeCollectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/13.
//

import UIKit
import SnapKit
import RxSwift
import RxDataSources

final class ItemTypeCollectionView: UIView {
    let disposeBag = DisposeBag()
    
    private lazy var itemTypeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50.0, left: 15.0, bottom: 50.0, right: 15.0)
        layout.minimumLineSpacing = 40.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 240/255, alpha: 1.0)
        collectionView.register(ItemTypeCollectionViewCell.self, forCellWithReuseIdentifier: "ItemTypeCollectionViewCell")
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: ItemTypeCollectionViewModel) {
        viewModel.cellData
            .drive(itemTypeCollectionView.rx.items(dataSource: configureDataSource()))
            .disposed(by: disposeBag)
    }
    
    private func configureDataSource() -> RxCollectionViewSectionedReloadDataSource<ItemTypeSection> {
        lazy var itemDataSource = RxCollectionViewSectionedReloadDataSource<ItemTypeSection>(configureCell: { dataSource, cv, indexPath, data in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "ItemTypeCollectionViewCell", for: indexPath) as! ItemTypeCollectionViewCell
            cell.setData(data)
            return cell
        })
            return itemDataSource
    }
    
    private func layout() {
        addSubview(itemTypeCollectionView)
        
        itemTypeCollectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension ItemTypeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4, height: (collectionView.frame.width / 4) + 20)
    }
}
