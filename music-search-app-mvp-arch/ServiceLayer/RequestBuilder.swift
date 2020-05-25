//
//  RequestBuilder.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/25/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

struct Param {
    var key: String
    var value: String
}

class RequestBuilder {
    
    func getUrl(baseURL: String) -> URL {
        let url = URL(string: baseURL)!
        
        return url
    }
    
    func getUrlWithParams(baseURL: String, params: [Param]) -> URL {
        var url = URL(string: baseURL)!
        var query = [String: String]()
        for param in params {
            query[param.key] = param.value
        }
        url = url.withQueries(query)!
        
        return url
    }
}
extension URL {
    
    func withQueries(_ queries: [String: String])-> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
