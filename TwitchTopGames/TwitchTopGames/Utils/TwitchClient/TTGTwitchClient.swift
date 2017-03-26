//
//  TTGTwitchClient.swift
//  TwitchTopGames
//
//  Created by João Carreira on 25/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import Foundation

final class TTGTwitchClient {
    
    typealias Payload = [String: AnyObject]
    
    static let singleton = TTGTwitchClient()
    
    func getTopGames(withCompletionHandler handler: @escaping (_ success: Bool, _ games: [TTGGame]?) -> ()) {
        
        JCNetworkWrapper.get(NSURL(string: "https://api.twitch.tv/kraken/games/top?limit=5") as! URL, headers: ["Client-ID":"wnkbmfji4ygkb5jw9z4bmy605wf61o"], parameters: nil) { (json, error) in
            
            if let json = json as? Payload {
                
                if let topGames = json["top"] as? Array<Dictionary<String, Any>> {
                
                    guard let games = TTGGame.arrayModelFromJsonData(topGames) else {
                        
                        handler(false, nil)
                        return
                    }
                    
                    handler(true, games)
                }
            }
        }
    }
    
    func getTopStreams(withCompletionHandler handler: @escaping (_ success: Bool, _ streams: [TTGStream]?) -> ()) {
        
        JCNetworkWrapper.get(NSURL(string: "https://api.twitch.tv/kraken/streams?game=Hearthstone&limit=10") as! URL, headers: ["Client-ID":"wnkbmfji4ygkb5jw9z4bmy605wf61o"], parameters: nil) { (json, error) in
            
            if let json = json as? Payload {
                
                if let topStreams = json["streams"] as? Array<Dictionary<String, Any>> {
                    
                    guard let streams = TTGStream.arrayModelFromJsonData(topStreams) else {
                        
                        handler(false, nil)
                        return
                    }
                    
                    handler(true, streams)
                }
            }
        }
    }
}
