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
    private var disposeBag = DisposeBag()
    
    private var bannerPageDataList: [BannerPageData] = []
    private var nowBannerPageIndex: Int = 1
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
    
        return collectionView
    }()
    
    lazy var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.autoBannerPageTimer()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: BannerCollectionViewModel) {
        viewModel.bannerPageDataList
            .drive(onNext: {
                self.bannerPageDataList = $0
                DispatchQueue.main.async {
                    self.collectionView.scrollToItem(at: [0, 1],
                                                     at: .left,
                                                     animated: false)
                }}).disposed(by: disposeBag)
    }
    
    // 무한 스크롤을 하기위한 베너 추가
    private func addBannerData() {
        let firstBanner = bannerPageDataList.first
        let lastBanner = bannerPageDataList.last
    
        bannerPageDataList.insert(lastBanner!, at: 0)
        bannerPageDataList.append(firstBanner!)
    }
    
    private func autoBannerPageTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.moveBannerPage()
        }
    }
    
    private func moveBannerPage() {
        if nowBannerPageIndex == bannerPageDataList.count - 2 {
            collectionView.scrollToItem(at: [0, 1], at: .right, animated: false)
            nowBannerPageIndex = 1
            
            return
        }
        
        nowBannerPageIndex += 1
        collectionView.scrollToItem(at: [0, nowBannerPageIndex], at: .right, animated: true)
    }
    
    private func layout() {
        [collectionView, pageControl].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(UIScreen.main.bounds.height / 2.3)
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.trailing.equalTo(collectionView)
            $0.width.equalTo(collectionView)
            $0.height.equalTo(50.0)
        }
    }
}

extension BannerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = bannerPageDataList.count - 2
        
        return bannerPageDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(bannerPageDataList[indexPath.item])
        
        return cell
    }
}

extension BannerCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension BannerCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.frame.size.width != 0.0 {
            let value = (scrollView.contentOffset.x) / scrollView.frame.width
            pageControl.currentPage = Int(round(value)) - 1
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let value = (scrollView.contentOffset.x / scrollView.frame.width)
        
        switch Int(round(value)) {
        case 0:
            let last = bannerPageDataList.count - 2
            collectionView.scrollToItem(at: [0, last], at: .left, animated: false)
            nowBannerPageIndex = last
        case bannerPageDataList.count - 1:
            collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
            nowBannerPageIndex = 1
        default:
            break
        }
    }
}

