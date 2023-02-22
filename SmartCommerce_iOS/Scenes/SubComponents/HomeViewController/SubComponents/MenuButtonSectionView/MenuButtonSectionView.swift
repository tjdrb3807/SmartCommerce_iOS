//
//  MenuButtonSectionView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa
import SnapKit

final class MenuButtonSectionView: UIView {
    let disposeBag = DisposeBag()
    
    private var menuButtonList: [UIButton] = []
    
    private lazy var horizontalStackView = UIStackView()
    private lazy var recommendMenuButton = UIButton()
    private lazy var rankingMenuButton = UIButton()
    private lazy var styleMenuButton = UIButton()
    private lazy var saleMenuButton = UIButton()
    private lazy var eventMenuButton = UIButton()
    private lazy var selectedBar = UIView()
    private lazy var separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: MenuButtonSectionViewModel) {
        viewModel.menuDataList
            .drive(onNext: { [weak self] menuDataList in
                menuDataList.forEach { self?.menuButtonList[$0.id].setButton($0) }
            }).disposed(by: disposeBag)
        
        viewModel.selectedMenuIndex
            .drive(onNext: { [weak self] in
                self?.isSelect($0)
            }).disposed(by: disposeBag)
        
        menuButtonList.forEach { button in
            button.rx.tap
                .map { button.tag }
                .bind(to: viewModel.menuButtonTapped)
                .disposed(by: disposeBag)
        }
    }
    
    private func attribute() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillProportionally
        
        selectedBar.backgroundColor = .black
    
        separatorView.backgroundColor = .separator
    }

    
    private func layout() {
        [horizontalStackView, selectedBar, separatorView].forEach { addSubview($0) }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30.0)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(horizontalStackView.snp.bottom).offset(-1.0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        [recommendMenuButton, rankingMenuButton, styleMenuButton, saleMenuButton, eventMenuButton].forEach {
            horizontalStackView.addArrangedSubview($0)
            menuButtonList.append($0)
        }
    }
    
    private func isSelect(_ index: Int) {
        menuButtonList.forEach {
            if $0.tag == index {
                $0.setTitleColor(.black, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
            } else {
                $0.setTitleColor(.gray, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .light)
            }
        }
    }
}

extension UIButton {
    func setButton(_ data: MenuData) {
        self.setTitle(data.title, for: .normal)
        self.tag = data.id
    }
}


struct MenuButtonSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            MenuButtonSectionView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
