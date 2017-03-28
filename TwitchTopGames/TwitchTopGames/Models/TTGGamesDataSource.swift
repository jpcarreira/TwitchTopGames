//
//  TTGGamesDataSource.swift
//  TwitchTopGames
//
//  Created by João Carreira on 27/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import Foundation

protocol TTGGameDataSourceDelegate: class {
    
    func didFinishRequest()
}

class TTGGamesDataSource {
    
    var topGames: [TTGGame] = [] {
        
        didSet {
            
            if topGames.count > 0 {
        
                delegate?.didFinishRequest()
            }
        }
    }
    
    weak var delegate: TTGGameDataSourceDelegate?
    
    init() {
        
        fetchGameData()
    }
    
    public func getNumberOfGames() -> Int {
        
        return topGames.count
    }
    
    public func getGame(atIndex index:Int) -> TTGGame {
        
        return topGames[index]
    }
    
    public func getGameTitle(atIndex index:Int) -> String? {
        
        return topGames[index].name
    }
    
    private func fetchGameData() {
        
        TTGTwitchClient.singleton.getTopGames(withLimit: 5) { (success, topGames) in
        
            if success, let topGames = topGames {
        
                self.topGames = topGames
            }
        }
    }
    
//    private func fetchStreamData(forGame game:String) {
//        
//        TTGTwitchClient.singleton.getTopStreams(forGame: game, withLimit: 10) { (success, topStreams) in
//        
//            if success, let topStreams = topStreams {
//        
//                self.topStreams.insert(topStreams)
//            }
//        }
//    }
}
