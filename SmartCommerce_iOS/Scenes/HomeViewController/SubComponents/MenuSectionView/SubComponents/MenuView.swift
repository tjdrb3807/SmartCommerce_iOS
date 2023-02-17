//
//  MenuView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MenuView: UIView {
    let disposeBag = DisposeBag()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private lazy var selectedBar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: MenuViewModel) {
        menuButton.rx.tap
            .bind(to: viewModel.menuButtonTapped)
            .disposed(by: disposeBag)
    }
    
    private func layout() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        [menuButton, selectedBar].forEach { stackView.addArrangedSubview($0) }
        
        selectedBar.snp.makeConstraints {
            $0.height.equalTo(3.0)
        }
    }
    
    func setData(_ data: MenuData) {
        menuButton.setTitle(data.title, for: .normal)
        menuButton.tag = data.id
    }
}
