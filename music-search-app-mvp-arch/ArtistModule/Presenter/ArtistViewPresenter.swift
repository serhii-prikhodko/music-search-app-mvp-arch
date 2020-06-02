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
    init(view: ArtistViewProtocol, networkService: NetworkServiceProtocol, artist: Artist?)
    func setArtistInfo()
}

class ArtistViewPresenter: ArtistViewPresenterProtocol {
    
    weak var view: ArtistViewProtocol?
    let networkService: NetworkServiceProtocol
    var artist: Artist?
    
    required init(view: ArtistViewProtocol, networkService: NetworkServiceProtocol, artist: Artist?) {
        self.view = view
        self.networkService = networkService
        self.artist = artist
    }
    
    func setArtistInfo() {
        self.view?.setArtistInfo(artist: self.artist)
    }
    
    
}
