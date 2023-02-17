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
    private let menuSectionView = MenuSectionView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        self.settingBind()
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: HomeViewModel) {
        
    }
    
    //MARK: SubComponents 구현하고 수정 및 제거
    private func settingBind() {
        menuSectionView.bind(MenuSectionViewModel())
    }
    
    private func layout() {
        [headerSectionView, menuSectionView].forEach { view.addSubview($0) }
        
        headerSectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10.0)
            $0.height.equalTo(40.0)
        }
        
        // TODO: UI 구현하고 변경
        menuSectionView.snp.makeConstraints {
            $0.top.equalTo(headerSectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30.0)
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
