//
//  NewsPresenter.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import Foundation

final class NewsPresenter {
	weak var view: NewsViewInput?
    weak var moduleOutput: NewsModuleOutput?
    
	private let router: NewsRouterInput
	private let interactor: NewsInteractorInput
    
    private var articles: [Article] = []
    
    init(router: NewsRouterInput, interactor: NewsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    
}

extension NewsPresenter: NewsModuleInput {
}

extension NewsPresenter: NewsViewOutput {
    func viewDidLoad() {
        self.interactor.loadArticles()
    }
    
}

extension NewsPresenter: NewsInteractorOutput {
    func didEncounterError(_ error: Error) {
        //ToDo
    }
    
    func didLoad(_ articles: [Article]) {
        self.articles = articles
        self.view?.set(viewModels: self.makeViewModels(self.articles))
    }
    
    
}

private extension NewsPresenter {
    func makeViewModels(_ articles: [Article]) -> [NewsCardViewModel] {
        return articles.map { article in
            NewsCardViewModel(info: "info",
                              title: article.title ?? "",
                              shortDescription: article.description ?? "",
                              imageName: article.urlToImage ?? "")
        }
    }
}
