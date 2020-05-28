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
    var artistParam: String? {get}
}

protocol SearchViewPresenterProtocol: class {
    func getSearchResults()
    init(view: SearchViewProtocol, networkService: NetworkServiceProtocol)
}

class SearchViewPresenter: SearchViewPresenterProtocol {
    
    weak var view: SearchViewProtocol?
    private let networkService: NetworkServiceProtocol
    weak private var searchViewDelegate: SearchViewPresenterProtocol?
    var artists: [Artist]?
    
    required init(view: SearchViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func getSearchResults() {
        if let searchString = self.view?.artistParam {
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
}
