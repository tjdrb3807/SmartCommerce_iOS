//
//  HomeViewConcoller.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import SwiftUI
import SnapKit

final class HomeViewController: UIViewController {
    
    private let headerSectionView = HeaderSectionView()
    private let menuButtonSectionView = MenuButtonSectionView()
    private let menuSectionView = UIView()
    
    private lazy var recommendViewController = RecommendViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        headerSectionView.bind(HeaderSectionViewModel())
        menuButtonSectionView.bind(MenuButtonSectionViewModel())
    
        self.addContentsView()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: HomeViewModel) {
        
    }
    
    private func addContentsView() {
        menuSectionView.translatesAutoresizingMaskIntoConstraints = false
        addChild(recommendViewController)
        recommendViewController.view.frame = menuSectionView.frame
        menuSectionView.addSubview(recommendViewController.view)
        recommendViewController.didMove(toParent: self)
    }
    
    private func layout() {
        [headerSectionView, menuButtonSectionView, menuSectionView].forEach { view.addSubview($0) }
        
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
        
        menuSectionView.snp.makeConstraints {
            $0.top.equalTo(menuButtonSectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
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
