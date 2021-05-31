//
//  NewsProtocols.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import Foundation

enum LoadingDataType {
    case nextPage
    case reload
}

protocol NewsModuleInput {
	var moduleOutput: NewsModuleOutput? { get }
}

protocol NewsModuleOutput: AnyObject {
}

protocol NewsViewInput: AnyObject {
    func set(viewModels: [NewsCardViewModel])
}

protocol NewsViewOutput: AnyObject {
    func viewDidLoad()
    func willDisplay(at index: Int)
}

protocol NewsInteractorInput: AnyObject {
    func reload()
    func loadNext()
}

protocol NewsInteractorOutput: AnyObject {
    func didEncounterError(_ error: Error)
    func didLoad(_ articles: [Article], loadType: LoadingDataType)
}

protocol NewsRouterInput: AnyObject {
}
