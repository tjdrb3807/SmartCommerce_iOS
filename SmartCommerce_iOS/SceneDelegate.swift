//
//  SceneDelegate.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let viewModel = TabBarViewModel()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootViewController = TabBarController()
        rootViewController.bind(viewModel)
        
        self.window?.rootViewController = rootViewController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
    }
}

