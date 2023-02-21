//
//  StyleViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/19.
//

import UIKit
import SnapKit

final class StyleViewController: UIViewController {
    private lazy var sampleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Style View"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.addSubview(sampleTitleLabel)
        
        sampleTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
