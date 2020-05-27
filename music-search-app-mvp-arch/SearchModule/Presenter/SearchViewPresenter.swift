//
//  SearchViewPresenter.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/27/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

protocol SearchViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol SearchViewDelegate: class {
    func showSearchResults() -> String
}

class SearchViewPresenter {
    
    weak var view: SearchViewProtocol?
    private let networkService: NetworkService
    weak private var searchViewDelegate: SearchViewDelegate?
    var artists: [Artist]?
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func setViewDelegate(searchViewDelegate: SearchViewDelegate?) {
        self.searchViewDelegate = searchViewDelegate
    }
    
    func getSearchResults(searchString: String) {
        self.networkService.findArtistByName(searchString: searchString) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let artists):
                    self.artists = artists
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
