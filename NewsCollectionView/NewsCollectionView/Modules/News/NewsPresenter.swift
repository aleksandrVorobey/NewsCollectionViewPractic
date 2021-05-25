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
    
    init(router: NewsRouterInput, interactor: NewsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension NewsPresenter: NewsModuleInput {
}

extension NewsPresenter: NewsViewOutput {
}

extension NewsPresenter: NewsInteractorOutput {
}
