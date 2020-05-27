//
//  NetworkService.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/25/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func findArtistByName(searchString: String, complition: @escaping (Result<[Artist]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func findArtistByName(searchString: String, complition: @escaping (Result<[Artist]?, Error>) -> Void) {
        let requestBuilder = RequestBuilder()
        let params = [Param(key: "term", value: searchString), Param(key: "entity", value: "musicArtist")]
        let url = requestBuilder.getUrlWithParams(baseURL: "https://itunes.apple.com/search", params: params)
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                complition(.failure(error))
                
                return
            }
            do {
                let obj = try JSONDecoder().decode([Artist].self, from: data!)
                complition(.success(obj))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
