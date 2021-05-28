//
//  NetworkServiceProtocols.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation

protocol ArticlesNetworkProtocol {
    func requestArticles(completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
}

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let identifier: String = UUID().uuidString
    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?
}
