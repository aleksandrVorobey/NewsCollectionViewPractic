//
//  AppCoordinator.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 25.05.2021.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let newsNavigationController = UINavigationController()
    private let tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let context = NewsContext(moduleOutput: nil)
        let container = NewsContainer.assemble(with: context)
        
        self.newsNavigationController.setViewControllers([container.viewController], animated: false)
        let newsTabBarItem = UITabBarItem(title: Localization.main, image: UIImage(systemName: "book"), tag: 0)
        self.newsNavigationController.tabBarItem = newsTabBarItem
        self.tabBarController.setViewControllers([self.newsNavigationController], animated: true)
        
        self.window.rootViewController = self.tabBarController
        self.window.makeKeyAndVisible()
    }
}
