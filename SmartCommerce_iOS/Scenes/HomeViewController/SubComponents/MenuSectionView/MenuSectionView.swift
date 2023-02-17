//
//  MenuSectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa
import SnapKit

final class MenuSectionView: UIView {
    let disposeBag = DisposeBag()
    
    private var menuList: [MenuView] = []
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
    
        return stackView
    }()
    
    private lazy var recommendMenu = MenuView()
    private lazy var rankingMenu = MenuView()
    private lazy var styleMenu = MenuView()
    private lazy var saleMenu = MenuView()
    private lazy var eventMenu = MenuView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingBind()
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: 추후에 변경
    private func settingBind() {
        for menu in menuList {
            menu.bind(MenuViewModel())
        }
    }
    
    func bind(_ viewModel: MenuSectionViewModel) {
        viewModel.menuData
            .drive(onNext: { list in
                for data in list {
                    self.menuList[data.id].setData(data)
                }
            }).disposed(by: disposeBag)
    }
    
    private func attribute() {
        [recommendMenu, rankingMenu, styleMenu, saleMenu, eventMenu].forEach {
            menuList.append($0)
        }
    }
    
    private func layout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50.0)
        }
        
        [recommendMenu, rankingMenu, styleMenu, saleMenu, eventMenu].forEach {
            stackView.addArrangedSubview($0)
        }
    }
}

struct MenuSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            MenuSectionView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
