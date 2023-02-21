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
    
    private let headerSectionView = HeaderSectionView()
    private let menuButtonSectionView = MenuButtonSectionView()
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30.0, weight: .bold)
        
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: HomeViewModel) {
        viewModel.selectedMenu
            .drive(onNext: { [weak self] in
                self?.testLabel.text = "\($0)"
                self?.menuButtonSectionView.bind(viewModel.menuButtonSectionViewModel)
            }).disposed(by: disposeBag)
    }
    
    private func layout() {
        [headerSectionView, menuButtonSectionView, testLabel].forEach { view.addSubview($0) }
        
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
        
        testLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
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
