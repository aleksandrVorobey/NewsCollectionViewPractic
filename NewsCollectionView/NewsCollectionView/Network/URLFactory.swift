//
//  URLFactory.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 27.05.2021.
//

import Foundation

enum URLFactory {
    private static let apiKey = "7ba646457e7a40b29f317b2e43b5081f"
    private static var baseUrl: URL {
        return baseUrlComponets.url!
    }
    private static let baseUrlComponets: URLComponents = {
        let url = URL(string: "https://newsapi.org/v2/")!
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponets = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponets.queryItems = [queryItem]
        return urlComponets
    }()
    
    
    static func articles(params: ArticlesRequestParams) -> String {
        let params = [URLQueryItem(name: "pageSize", value: "\(params.pageSize)"),
                      URLQueryItem(name: "page", value: "\(params.page)"),
                      URLQueryItem(name: "q", value: params.search)]
        var urlComponents = baseUrlComponets
        urlComponents.queryItems?.append(contentsOf: params)
        return urlComponents.url!.appendingPathComponent("everything").absoluteString
    }

}
