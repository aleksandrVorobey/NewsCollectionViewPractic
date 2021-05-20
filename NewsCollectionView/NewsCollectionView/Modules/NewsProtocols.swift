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

protocol NewsModuleOutput: class {
}

protocol NewsViewInput: class {
}

protocol NewsViewOutput: class {
}

protocol NewsInteractorInput: class {
}

protocol NewsInteractorOutput: class {
}

protocol NewsRouterInput: class {
}
