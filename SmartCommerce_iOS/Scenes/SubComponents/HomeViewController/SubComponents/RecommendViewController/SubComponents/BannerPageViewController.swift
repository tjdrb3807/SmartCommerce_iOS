//
//  BannerPageViewController.swift
//  SmartCommerce_iOS
//
//  Created by 전성규 on 2023/02/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class BannerPageViewController: UIPageViewController {
    var completeHandler: ((Int) -> ())?
    
    let viewList: [UIViewController] = {
        let testPage01 = UIViewController()
        let testPage02 = UIViewController()
        let testPage03 = UIViewController()
        
        testPage01.view.backgroundColor = .red
        testPage02.view.backgroundColor = .orange
        testPage03.view.backgroundColor = .yellow
        
        return [testPage01, testPage02, testPage03]
    }()
    
    var currentPageIndex: Int {
        guard let viewController = viewControllers?.first else { return 0 }
        
        return viewList.firstIndex(of: viewController) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = viewList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    private func setViewControllersFromIndex(index: Int) {
        if index < 0 && index >= viewList.count { return }
        self.setViewControllers([viewList[index]], direction: .forward, animated: true, completion: nil)
        completeHandler?(currentPageIndex)
    }
}

extension BannerPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewList.firstIndex(of: viewController) else { return nil }
        if index == 0 { return viewList.last }
        
        return viewList[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewList.firstIndex(of: viewController) else { return nil }
        if index + 1 == viewList.count { return viewList.first }
        
        return viewList[index + 1]
    }
}

extension BannerPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            completeHandler?(currentPageIndex)
        }
    }
}
