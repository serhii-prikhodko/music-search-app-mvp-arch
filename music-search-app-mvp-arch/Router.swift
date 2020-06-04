//
//  RouterProtocol.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 04.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}
protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showArtistDetails(artist: Artist?)
    func popToRoot()
}
class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = self.assemblyBuilder?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showArtistDetails(artist: Artist?) {
        if let navigationController = navigationController {
            guard let artistViewController = self.assemblyBuilder?.createArtistModule(artist: artist, router: self) else {return}
            navigationController.pushViewController(artistViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
