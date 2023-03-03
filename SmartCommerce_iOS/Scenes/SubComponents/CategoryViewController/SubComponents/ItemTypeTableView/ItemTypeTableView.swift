//
//  ItemTypeTableView.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/23.
//

import UIKit
import SnapKit
import SwiftUI
import RxSwift
import RxCocoa

final class ItemTypeTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(ItemTypeTableViewCell.self, forCellReuseIdentifier: "ItemTypeTableViewCell")
        tableView.dataSource = self
        tableView.rowHeight = 250.0
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ voiwModel: ItemTypeTableViewModel) {
        
    }
    
    private func layout() {
        addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension ItemTypeTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTypeTableViewCell", for: indexPath) as? ItemTypeTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}


struct ItemTypeTableView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            ItemTypeTableView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
    }
}
