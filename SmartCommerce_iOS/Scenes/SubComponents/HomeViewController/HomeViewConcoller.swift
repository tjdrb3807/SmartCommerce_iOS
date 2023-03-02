//
//  HomeViewConcoller.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import SwiftUI
import SnapKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    private var contentViewList: [UIViewController] = []
    private var selectedMenuIndex: Int = 0
    
    private let headerSectionView = HeaderSectionView()
    private let menuButtonSectionView = MenuButtonSectionView()
    
    private let containerView = UIView()
    
    private lazy var recommendContentView = RecommendViewController()
    private lazy var rankingContentView = RankingViewController()
    private lazy var styleContentView = StyleViewController()
    private lazy var saleContentView = SaleViewContorller()
    private lazy var eventContentView = EventViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: HomeViewModel) {
        menuButtonSectionView.bind(viewModel.menuButtonSectionViewModel)
        recommendContentView.bind(viewModel.recommendViewModel)
        
        viewModel.selectedMenu
            .drive(onNext: { [weak self] in
                self?.removeContentView(self!.selectedMenuIndex)
                self?.addContentView($0)
                self?.selectedMenuIndex = $0
            }).disposed(by: disposeBag)
    }
    
    private func attribute() {
        [recommendContentView, rankingContentView, styleContentView, saleContentView, eventContentView].forEach { contentViewList.append($0) }
    }
    
    private func layout() {
        [headerSectionView, menuButtonSectionView, containerView].forEach { view.addSubview($0) }
        
        headerSectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10.0)
            $0.height.equalTo(40.0)
        }
        
        // TODO: UI 구현하고 변경
        menuButtonSectionView.snp.makeConstraints {
            $0.top.equalTo(headerSectionView.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(35.0)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(menuButtonSectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addContentView(_ index: Int) {
        let contentView = contentViewList[index]
        
        addChild(contentView)
        contentView.view.frame = containerView.frame
        containerView.addSubview(contentView.view)
        contentView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.didMove(toParent: self)
    }
    
    private func removeContentView(_ index: Int) {
        let contentView = contentViewList[index]
        
        contentView.willMove(toParent: nil)
        contentView.removeFromParent()
        contentView.view.removeFromSuperview()
    }
}

struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            HomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        
        typealias UIViewControllerType = UIViewController
    }
}
