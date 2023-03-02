//
//  BannerCollectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/03/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class BannerCollectionView: UIView {
    let disposeBag = DisposeBag()
    
    private var cardContents: [BannerPageData] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.headerReferenceSize = .zero
        layout.footerReferenceSize = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private lazy var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    func bind(_ viewModel: BannerCollectionViewModel) {
        viewModel.bannerPageDataList
            .drive(onNext: {
                self.cardContents = $0
            }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [collectionView, pageControl].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(UIScreen.main.bounds.height / 2.3)
            
            $0.edges.equalToSuperview()
            
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10.0)
            $0.left.right.equalToSuperview()
        }
    }
}

extension BannerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = cardContents.count
        
        return self.cardContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        
        cell.setData(cardContents[indexPath.item])
        
        return cell
    }
}

extension BannerCollectionView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.frame.size.width != 0.0 {
            let value = (scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = Int(round(value))
        }
    }
}

extension BannerCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

