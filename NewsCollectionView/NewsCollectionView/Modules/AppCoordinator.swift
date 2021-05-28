//
//  AppCoordinator.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 25.05.2021.
//

import UIKit

class AppCoordinator {
    
    private let appDependency: AppDependency
    private let window: UIWindow
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()
    
    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
    }
        
    func start() {
        self.setupNews()
        self.setupPrize()
        let navigationControllers = NavControllerType.allCases.compactMap {self.navigationControllers[$0]}
        self.tabBarController.setViewControllers(navigationControllers, animated: true)
        
        self.window.rootViewController = self.tabBarController
        self.window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func setupNews() {
        guard let navController = self.navigationControllers[.news] else {
            fatalError("can't find navController")
        }
        
        let context = NewsContext(moduleDependencies: self.appDependency, moduleOutput: nil)
        let container = NewsContainer.assemble(with: context)
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.news.title
    }
    func setupPrize() {
        guard let navController = self.navigationControllers[.prize] else {
            fatalError("can't find navController")
        }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        navController.setViewControllers([viewController], animated: true)
        viewController.navigationItem.title = NavControllerType.prize.title
    }
     static func makeNavigationControllers() -> [NavControllerType: UINavigationController] {
        var result: [NavControllerType: UINavigationController] = [:]
        NavControllerType.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.title,
                                              image: navControllerKey.image,
                                              tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            navigationController.navigationBar.prefersLargeTitles = true
            result[navControllerKey] = navigationController
        }
        return result
    }
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case news, prize, video, thumbsUp, podcasts
    
    var title: String {
        switch self {
        case .news:
            return Localization.news
        case .prize:
            return Localization.prize
        case .thumbsUp:
            return Localization.thumbsUp
        case .podcasts:
            return Localization.podcasts
        case .video:
            return Localization.video
        }
    }
    
    var image: UIImage? {
        switch self {
        case .news:
            return UIImage(systemName: "book")
        case .prize:
            return UIImage(systemName: "giftcard")
        case .thumbsUp:
            return UIImage(systemName: "hand.wave")
        case .podcasts:
            return UIImage(systemName: "play.circle")
        case .video:
            return UIImage(systemName: "play.rectangle")
        }
    }
}
