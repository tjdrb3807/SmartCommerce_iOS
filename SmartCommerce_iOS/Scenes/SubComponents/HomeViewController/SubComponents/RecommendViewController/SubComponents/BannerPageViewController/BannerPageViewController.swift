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
import Kingfisher

final class BannerPageViewController: UIPageViewController {
    let disposeBag = DisposeBag()
    
    var completeHandler: ((Int) -> ())?
    
    var bannerPageDataList: [BannerPageData] = []
    
//    var viewList: [UIViewController] = {
//        let testPage01 = UIViewController()
//        let testPage02 = UIViewController()
//        let testPage03 = UIViewController()
//        let testPage04 = UIViewController()
//
//        return [testPage01, testPage02, testPage03, testPage04]
//    }()
    
    var viewList: [UIViewController] = []
    
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
    
    func bind(_ viewModel: BannerPageViewModel) {
        self.rx.viewWillAppear
            .bind(to: viewModel.bannerPageViewWillAppear)
            .disposed(by: disposeBag)
        
        viewModel.bannerPageList
            .drive(onNext: {
                self.bannerPageDataList = $0
                for data in self.bannerPageDataList {
                    let banner = BannerViewController()
                    banner.setData(data)
                    banner.view.backgroundColor = .blue
                    
                    self.viewList.append(banner)
                }
            }).disposed(by: disposeBag)
        
        
    }
    
    private func addBanner() {
        for data in bannerPageDataList {
            let banner = BannerViewController()
            banner.setData(data)
            banner.view.backgroundColor = .blue
            
            viewList.append(banner)
            print(self.viewList)
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

extension UIViewController {
    func setBackgroundImage(_ thumbnailURL: URL) {
        let imageView = UIImageView()
        imageView.kf.setImage(with: thumbnailURL)
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
