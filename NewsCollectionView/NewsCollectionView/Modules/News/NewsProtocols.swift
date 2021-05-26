//
//  NewsProtocols.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import Foundation

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
}

protocol NewsInteractorInput: AnyObject {
}

protocol NewsInteractorOutput: AnyObject {
}

protocol NewsRouterInput: AnyObject {
}
