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
    // TODO: add box and logo objects
    let viewers: Int?
    let channels: Int?
    
    init?(json: JSON) {
        
        name = "game.name" <~~ json
        popularity = "game.popularity" <~~ json
        viewers = "viewers" <~~ json
        channels = "channels" <~~ json
    }

    static func arrayModelFromJsonData(_ jsonData: Array<JSON>) -> [TTGGame]? {
        
        return [TTGGame].from(jsonArray: jsonData)
    }
}
