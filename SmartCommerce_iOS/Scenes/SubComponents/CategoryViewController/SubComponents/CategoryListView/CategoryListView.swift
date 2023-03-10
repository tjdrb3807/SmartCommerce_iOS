//
//  CategoryListView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit
import SwiftUI
import RxSwift
import RxCocoa

final class CategoryListView: UIView {
    let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.register(CategoryListViewCell.self, forCellReuseIdentifier: "CategoryListViewCell")
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryListViewModel) {
        viewModel.cellData
            .drive(tableView.rx.items) { tableView, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListViewCell", for: index) as! CategoryListViewCell
                cell.setData(data)
                
                return cell
                
            }.disposed(by: disposeBag)
        
        viewModel.categoryId
            .drive(onNext: { [self] in
                for _ in 0..<tableView.numberOfRows(inSection: 0) {
                    tableView.selectRow(at: IndexPath(row: $0, section: 0), animated: false, scrollPosition: .none)
                }
            }).disposed(by: disposeBag)
    }
    
    private func layout() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}






