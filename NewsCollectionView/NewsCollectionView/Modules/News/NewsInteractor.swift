//
//  NewsInteractor.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import Foundation

final class NewsInteractor {
	weak var output: NewsInteractorOutput?
    
    private let articlesNetworkService: ArticlesNetworkProtocol
    
    private var isLoading = false
    private var page: Int = Constants.initialPage
    
    init(articlesNetworkService: ArticlesNetworkProtocol) {
        self.articlesNetworkService = articlesNetworkService
    }
}

extension NewsInteractor: NewsInteractorInput {
    func reload() {
        self.page = Constants.initialPage
        self.load()
    }
    
    func loadNext() {
        self.load()
    }
}

private extension NewsInteractor {
    func load() {
        let params = ArticlesRequestParams(pageSize: 20, page: self.page, search: "world")
        self.articlesNetworkService.requestArticles(params: params) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.output?.didLoad(response.articles, loadType: self.page == Constants.initialPage ? .reload : .nextPage)
                self.page += 1
            case .failure(let error):
                self.output?.didEncounterError(error)
            }
        }
    }
}

private enum Constants {
    static let initialPage = 1
}
