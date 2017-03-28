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

final class TTGGamesDataSource {
    
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
    
    func getNumberOfGames() -> Int {
        
        return topGames.count
    }
    
    func getGame(atIndex index:Int) -> TTGGame {
        
        return topGames[index]
    }
    
    func getGameTitle(atIndex index:Int) -> String? {
        
        return topGames[index].name
    }
    
    private func fetchGameData() {
        
        TTGTwitchClient.singleton.getTopGames(withLimit: 5) { (success, topGames) in
        
            if success, let topGames = topGames {
        
                self.topGames = topGames
            }
        }
    }
}
