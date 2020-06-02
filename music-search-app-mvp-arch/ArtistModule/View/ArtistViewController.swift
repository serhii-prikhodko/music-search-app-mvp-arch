//
//  ArtistViewController.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/31/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistMainGenreLabel: UILabel!
    var presenter: ArtistViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ArtistViewController: ArtistViewProtocol {
    func setArtistInfo(artist: Artist?) {
        self.artistNameLabel.text = artist?.artistName
        self.artistMainGenreLabel.text = artist?.primaryGenreName
    }
}
