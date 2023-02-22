//
//  RecommendViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/19.
//

import UIKit
import SnapKit
import SwiftUI

final class RecommendViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let verticalStackView = UIStackView()
    private let bannerContainerView = UIView()
    private let bannerPageViewController = BannerPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let bannerPageControl = BannerPageControl()
    private let categoryCollectionView = CategoryCollectionView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.addContentView()
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [bannerContainerView, categoryCollectionView].forEach { verticalStackView.addArrangedSubview($0) }
        
        bannerContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 2.3)
        }
        
        bannerContainerView.addSubview(bannerPageControl)
        
        bannerPageControl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(bannerContainerView.snp.bottom)
        }
    
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerContainerView.snp.bottom).offset(30.0)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
    
    private func addContentView() {
        addChild(bannerPageViewController)
        bannerPageViewController.view.frame = bannerContainerView.frame
        bannerContainerView.addSubview(bannerPageViewController.view)
        bannerPageViewController.didMove(toParent: self)
    }
}

struct RecommendViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            RecommendViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        
        typealias UIViewControllerType = UIViewController
    }
}
