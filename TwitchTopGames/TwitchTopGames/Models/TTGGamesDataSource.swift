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
    
    private func fetchGameData() {
        
        TTGTwitchClient.singleton.getTopGames(withLimit: 8) { (success, topGames) in
        
            if success, let topGames = topGames {
        
                self.topGames = topGames
            }
        }
    }
}

//
//TTGTwitchClient.singleton.getTopStreams(forGame: "Alien: Isolation", withLimit: 4) { (success, topStreams) in
//    
//    if success {
//        
//        print(topStreams ?? "no streams")
//        
//    } else {
//        
//        print("some error occured")
//    }
//}
