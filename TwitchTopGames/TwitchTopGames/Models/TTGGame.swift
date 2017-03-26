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
    let boxImageLarge: String?
    let boxImageMedium: String?
    let boxImageSmall: String?
    let logoImageLarge: String?
    let logoImageMedium: String?
    let logoImageSmall: String?
    let viewers: Int?
    let channels: Int?
    
    init?(json: JSON) {
        
        name = "game.name" <~~ json
        popularity = "game.popularity" <~~ json
        boxImageLarge = "game.box.large" <~~ json
        boxImageMedium = "game.box.medium" <~~ json
        boxImageSmall = "game.box.small" <~~ json
        logoImageLarge = "game.logo.large" <~~ json
        logoImageMedium = "game.logo.medium" <~~ json
        logoImageSmall = "game.logo.small" <~~ json
        viewers = "viewers" <~~ json
        channels = "channels" <~~ json
    }

    static func arrayModelFromJsonData(_ jsonData: Array<JSON>) -> [TTGGame]? {
        
        return [TTGGame].from(jsonArray: jsonData)
    }
}
