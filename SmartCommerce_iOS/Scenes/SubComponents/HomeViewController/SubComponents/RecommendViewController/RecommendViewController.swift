//
//  RecommendViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/19.
//

import UIKit
import SnapKit
import SwiftUI
import RxSwift
import RxCocoa

final class RecommendViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let verticalStackView = UIStackView()
    private let bannerCollectionView = BannerCollectionView()
    private let categoryCollectionView = CategoryCollectionView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: RecommendViewModel) {
        bannerCollectionView.bind(viewModel.bannerCollectionViewModel)
        
        self.rx.viewWillAppear
            .bind(to: viewModel.recommendViewWillAppear)
            .disposed(by: disposeBag)
            
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
        
        [bannerCollectionView, categoryCollectionView].forEach { verticalStackView.addArrangedSubview($0) }
        
        bannerCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 2.3)
        }
    
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerCollectionView.snp.bottom).offset(30.0)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
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
