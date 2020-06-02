//
//  ModuleBuilder.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/31/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = SearchViewController()
        let networkService = NetworkService()
        let presenter = SearchViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
}
