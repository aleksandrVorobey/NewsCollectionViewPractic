//
//  NewsContainer.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import UIKit

final class NewsContainer {
    let input: NewsModuleInput
	let viewController: UIViewController
	private(set) weak var router: NewsRouterInput!

	static func assemble(with context: NewsContext) -> NewsContainer {
        let router = NewsRouter()
        let interactor = NewsInteractor(articlesNetworkService: context.moduleDependencies.articlesNetworkService)
        let presenter = NewsPresenter(router: router, interactor: interactor)
		let viewController = NewsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return NewsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: NewsModuleInput, router: NewsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct NewsContext {
    typealias ModuleDependencies = HasArticlesNetworkService
    let moduleDependencies: ModuleDependencies
	weak var moduleOutput: NewsModuleOutput?
}
