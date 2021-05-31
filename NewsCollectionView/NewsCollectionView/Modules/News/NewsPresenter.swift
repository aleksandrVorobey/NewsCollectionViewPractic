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
    
    private var isNextPageLoading = false
    private var isRealoding = false
    private var hasNextPage = true
    
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
        self.isRealoding = true
        self.interactor.reload()
    }
    
    func willDisplay(at index: Int) {
        guard !self.isRealoding,
              !self.isNextPageLoading,
              (self.articles.count - index) < 10 else { return }
        self.isNextPageLoading = true
        self.interactor.loadNext()
    }
}

extension NewsPresenter: NewsInteractorOutput {
    func didEncounterError(_ error: Error) {
        //ToDo
    }
    
    func didLoad(_ articles: [Article], loadType: LoadingDataType) {
        switch loadType {
        case .reload:
            self.isRealoding = false
            self.articles = articles
        case .nextPage:
            self.isNextPageLoading = false
            self.hasNextPage = articles.count > 0
            self.articles.append(contentsOf: articles)
        }
        let viewModels: [NewsCardViewModel] = self.makeViewModels(self.articles)
        self.view?.set(viewModels: viewModels)
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
