//
//  ArtistViewPresenter.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 02.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

protocol ArtistViewProtocol: class {
    func setArtistInfo(artist: Artist?)
}

protocol ArtistViewPresenterProtocol: class {
    init(view: ArtistViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, artist: Artist?)
    func setArtistInfo()
    func tapBack()
}

class ArtistViewPresenter: ArtistViewPresenterProtocol {
    
    weak var view: ArtistViewProtocol?
    let networkService: NetworkServiceProtocol
    var artist: Artist?
    var router: RouterProtocol?
    
    required init(view: ArtistViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, artist: Artist?) {
        self.view = view
        self.networkService = networkService
        self.artist = artist
        self.router = router
    }
    
    func setArtistInfo() {
        self.view?.setArtistInfo(artist: self.artist)
    }
    
    func tapBack() {
        self.router?.popToRoot()
    }
}
