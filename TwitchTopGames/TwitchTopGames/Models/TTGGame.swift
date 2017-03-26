//
//  TTGGame.swift
//  TwitchTopGames
//
//  Created by João Carreira on 25/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import Foundation
import Gloss

struct TTGGame: Decodable {
    
    let name: String?
    let popularity: Int?
    let boxImageLargeUrl: String?
    let boxImageMediumUrl: String?
    let boxImageSmallUrl: String?
    let logoImageLargeUrl: String?
    let logoImageMediumUrl: String?
    let logoImageSmallUrl: String?
    let viewers: Int?
    let channels: Int?
    
    init?(json: JSON) {
        
        name = "game.name" <~~ json
        popularity = "game.popularity" <~~ json
        boxImageLargeUrl = "game.box.large" <~~ json
        boxImageMediumUrl = "game.box.medium" <~~ json
        boxImageSmallUrl = "game.box.small" <~~ json
        logoImageLargeUrl = "game.logo.large" <~~ json
        logoImageMediumUrl = "game.logo.medium" <~~ json
        logoImageSmallUrl = "game.logo.small" <~~ json
        viewers = "viewers" <~~ json
        channels = "channels" <~~ json
    }

    static func arrayModelFromJsonData(_ jsonData: Array<JSON>) -> [TTGGame]? {
        
        return [TTGGame].from(jsonArray: jsonData)
    }
}
