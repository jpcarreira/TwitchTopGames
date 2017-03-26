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
    
    var baseUrl: String {
        
        return "https://api.twitch.tv/kraken/"
    }
    
    var clientId: String {
        
        return "wnkbmfji4ygkb5jw9z4bmy605wf61o"
    }
    
    func getTopGames(withLimit limit: Int, completionHandler handler: @escaping (_ success: Bool, _ games: [TTGGame]?) -> ()) {
        
        var url = baseUrl + "games/top"
        let parameters = ["limit": String(limit)]
        
        JCNetworkWrapper.get(&url, headers: ["Client-ID": clientId], parameters: parameters) { (json, error) in
            
            if let json = json as? Payload {
                
                if let topGames = json["top"] as? Array<Dictionary<String, Any>> {
                
                    guard let games = TTGGame.arrayModelFromJsonData(topGames) else {
                        
                        handler(false, nil)
                        return
                    }
                    
                    handler(true, games)
                }
            
            } else {
                
                handler(false, nil)
            }
        }
    }
    
    func getTopStreams(forGame game:String, withLimit:Int, handler: @escaping (_ success: Bool, _ streams: [TTGStream]?) -> ()) {
        
        var url = baseUrl + "streams"
        let parameters = ["game": game, "limit": String(withLimit)]
        
        JCNetworkWrapper.get(&url, headers: ["Client-ID": clientId], parameters: parameters) { (json, error) in
            
            if let json = json as? Payload {
                
                if let topStreams = json["streams"] as? Array<Dictionary<String, Any>> {
                    
                    guard let streams = TTGStream.arrayModelFromJsonData(topStreams) else {
                        
                        handler(false, nil)
                        return
                    }
                    
                    handler(true, streams)
                }
            
            } else {
                
                handler(false, nil)
            }
        }
    }
}
