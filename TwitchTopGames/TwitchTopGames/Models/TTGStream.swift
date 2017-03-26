//
//  TTGStream.swift
//  TwitchTopGames
//
//  Created by João Carreira on 26/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import Foundation
import Gloss

struct TTGStream: Decodable {
    
    // stream info
    let gameName: String?
    let viewers: Int?
    let previewImageLargeUrl: String?
    let previewImageMediumUrl: String?
    let previewImageSmallUrl: String?
    // channel object
    let channelDisplayName: String?
    let channelName: String?
    let channelLogoUrl: String?
    let channelUrl: String?
    let channelViews: Int?
    
    init?(json: JSON) {
        
        gameName = "game" <~~ json
        viewers = "viewers" <~~ json
        previewImageLargeUrl = "preview.large" <~~ json
        previewImageMediumUrl = "preview.medium" <~~ json
        previewImageSmallUrl = "preview.small" <~~ json
        channelDisplayName = "channel.display_name" <~~ json
        channelName = "channel.name" <~~ json
        channelLogoUrl = "channel.logo" <~~ json
        channelUrl = "channel.url" <~~ json
        channelViews = "channel.views" <~~ json
    }
    
    static func arrayModelFromJsonData(_ jsonData: Array<JSON>) -> [TTGStream]? {
        
        return [TTGStream].from(jsonArray: jsonData)
    }
}
