//
//  TabBarController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/22.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController {
    private let categoryViewController = UIViewController()
    private let homeViewController = HomeViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TabBarViewModel) {
        self.homeViewController.bind(HomeViewModel())
    }
    
    private func attribute() {
        viewControllers = [categoryViewController, homeViewController]
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        
        let categoryTabBarItem = UITabBarItem(title: "카테고리", image: UIImage(systemName: "list.bullet"), tag: 0)
        let homeTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        
        categoryViewController.tabBarItem = categoryTabBarItem
        homeViewController.tabBarItem = homeTabBarItem
    }
}
