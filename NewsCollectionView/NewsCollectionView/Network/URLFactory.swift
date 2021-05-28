//
//  URLFactory.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation

struct URLFactory {
    private static let apiKey = "7ba646457e7a40b29f317b2e43b5081f"
    private let urlComponets: URLComponents
    
    let articles: String
    
    init(baseUrl: URL = URL(string: "https://newsapi.org/v2/")!) {
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponets = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)!
        urlComponets.queryItems = [queryItem]
        
        self.urlComponets = urlComponets
        self.articles = urlComponets.url!.appendingPathComponent("everything").absoluteString
    }
}
