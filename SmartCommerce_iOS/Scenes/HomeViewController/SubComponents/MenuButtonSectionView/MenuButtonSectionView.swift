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
                guard let self = self else { return }
                for data in menuDataList {
                    self.menuButtonList[data.id].setButton(data)
                }
            }).disposed(by: disposeBag)
        
        viewModel.selectedMenu
            .drive(onNext: { index in
                for button in self.menuButtonList {
                    if button.tag == index {
                        button.selectedButton(true)
                    } else {
                        button.selectedButton(false)
                    }
                }
            }).disposed(by: disposeBag)
        
        menuButtonList.forEach { button in
            button.rx.tap
                .map { _ -> Int in
                    button.tag
                }.bind(to: viewModel.menuButtonTapped)
                .disposed(by: disposeBag)
        }
    }
    
    private func attribute() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillProportionally
        
        separatorView.backgroundColor = .separator
    }
    
    private func layout() {
        [horizontalStackView, separatorView].forEach { addSubview($0) }
        
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
}

extension UIButton {
    func setButton(_ data: MenuData) {
        self.setTitle(data.title, for: .normal)
        self.tag = data.id
    }
    
    func selectedButton(_ isChecked: Bool) {
        if isChecked {
            self.setTitleColor(.black, for: .normal)
            self.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        } else {
            self.setTitleColor(.gray, for: .normal)
            self.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .light)
        }
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
