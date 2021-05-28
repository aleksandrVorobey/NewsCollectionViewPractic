//
//  AppDependency.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation
protocol HasArticlesNetworkService {
    var articlesNetworkService: ArticlesNetworkProtocol { get }
}

class AppDependency {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    static func makeDefault() -> AppDependency {
        let networkService = NetworkService(urlFactory: URLFactory())
        return AppDependency(networkService: networkService)
    }
}

extension AppDependency: HasArticlesNetworkService {
    var articlesNetworkService: ArticlesNetworkProtocol {
        return self.networkService
    }
    
    
}
