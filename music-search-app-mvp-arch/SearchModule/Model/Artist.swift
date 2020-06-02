//
//  Artist.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/25/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

struct Artist: Codable {
    var artistName: String?
    var artistId: Int?
    var artistLinkUrl: String?
    var primaryGenreName: String?
}

struct ArtistList: Codable {
    var results: [Artist]?
}
