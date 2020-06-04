//
//  ModuleBuilder.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/31/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createArtistModule(artist: Artist?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = SearchViewController()
        let networkService = NetworkService()
        let presenter = SearchViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createArtistModule(artist: Artist?, router: RouterProtocol) -> UIViewController {
        let view = ArtistViewController()
        let networkService = NetworkService()
        let presenter = ArtistViewPresenter(view: view, networkService: networkService, router: router, artist: artist)
        view.presenter = presenter
        
        return view
    }
}
