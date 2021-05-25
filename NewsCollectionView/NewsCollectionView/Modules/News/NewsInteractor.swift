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
}

extension NewsInteractor: NewsInteractorInput {
}
