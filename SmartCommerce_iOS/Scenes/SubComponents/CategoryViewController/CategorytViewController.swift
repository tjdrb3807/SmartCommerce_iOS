//
//  CategorytViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit
import SwiftUI
import RxSwift
import RxCocoa

final class CategoryViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    private let searchBarView = SearchBarView()
    private let separator = UIView()
    private let eventCategoryListView = EventCategoryListView()
    private let categoryListView = CategoryListView()
    private let itemTypeTableView = ItemTypeTableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryViewModel) {
        self.eventCategoryListView.bind(viewModel.eventCategoryListViewModel)
        self.categoryListView.bind(viewModel.categoryListViewModel)
        
        self.rx.viewWillAppear
            .bind(to: viewModel.categoryViewWillAppear)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        separator.backgroundColor = .separator
    }
    
    private func layout() {
        [searchBarView, separator, eventCategoryListView, categoryListView, itemTypeTableView].forEach { view.addSubview($0) }

        searchBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60.0)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1.0)
        }
        
        eventCategoryListView.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(90.0)
        }
        
        categoryListView.snp.makeConstraints {
            $0.top.equalTo(eventCategoryListView.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 3.5)
        }
        
        itemTypeTableView.snp.makeConstraints {
            $0.top.equalTo(categoryListView)
            $0.leading.equalTo(categoryListView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in }
        
        return ControlEvent(events: source)
    }
}

struct GategoryViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            CategoryViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        
        typealias UIViewControllerType = UIViewController
    }
}
