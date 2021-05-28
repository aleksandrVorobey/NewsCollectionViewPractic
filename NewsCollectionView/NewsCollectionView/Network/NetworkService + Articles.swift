//
//  NetworkService + Articles.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let params = URLQueryItem(name: "q", value: "world")
        let url = "\(self.urlFactory.articles)&\(params)"
        self.baseRequest(url: url, completion: completion)
    }
    
    
}