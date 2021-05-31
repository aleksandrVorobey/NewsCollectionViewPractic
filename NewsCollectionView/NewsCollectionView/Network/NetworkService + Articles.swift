//
//  NetworkService + Articles.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(params: ArticlesRequestParams, completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let url = URLFactory.articles(params: params)
        self.baseRequest(url: url, completion: completion)
    }
}
