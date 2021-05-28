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
    
    init(articlesNetworkService: ArticlesNetworkProtocol) {
        self.articlesNetworkService = articlesNetworkService
    }
}

extension NewsInteractor: NewsInteractorInput {
    func loadArticles() {
        self.articlesNetworkService.requestArticles { result in
            switch result {
            case .success(let response):
                self.output?.didLoad(response.articles)
            case .failure(let error):
                self.output?.didEncounterError(error)
            }
        }
    }
    
}
