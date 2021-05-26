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
    func viewDidLoad() {
        self.view?.set(viewModels: self.makeViewModels())
    }
    
}

extension NewsPresenter: NewsInteractorOutput {
}

private extension NewsPresenter {
    func makeViewModels() -> [NewsCardViewModel] {
        return [NewsCardViewModel(info: "Test string", title: "BIG Text", shortDescription: "Description", imageName: "news1"),
                NewsCardViewModel(info: "Test string2", title: "BIG Text2", shortDescription: "Description2", imageName: "news2"),
                NewsCardViewModel(info: "Test string3", title: "BIG Text3", shortDescription: "Description3", imageName: "news3")]
    }
}
