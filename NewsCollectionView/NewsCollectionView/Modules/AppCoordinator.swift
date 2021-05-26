//
//  AppCoordinator.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 25.05.2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private let navigationControllers: [NavControllerType: UINavigationController]
    private let newsNavigationController = UINavigationController()
    private let tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
        self.navigationControllers = AppCoordinator.makeNavigationControllers()
    }
    
    
    
    func start() {
        self.setupNews()
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
        
        let context = NewsContext(moduleOutput: nil)
        let container = NewsContainer.assemble(with: context)
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.news.title
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
