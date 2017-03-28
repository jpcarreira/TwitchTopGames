//
//  TTGStreamDataSource.swift
//  TwitchTopGames
//
//  Created by João Carreira on 28/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import Foundation

protocol TTGStreamDataSourceDelegate: class {
    
    func didFinishRequest()
}

final class TTGStreamDataSource {
    
    var topStreams: [TTGStream] = [] {
        
        didSet {
            
            if topStreams.count > 0 {
                
                delegate?.didFinishRequest()
            }
        }
    }
    
    weak var delegate: TTGStreamDataSourceDelegate?
    
    func fetchStreamData(forGame game:String) {
        
        TTGTwitchClient.singleton.getTopStreams(forGame: game, withLimit: 10) { (success, topStreams) in
            
            if success, let topStreams = topStreams {
                
                self.topStreams = topStreams
            }
        }
    }
    
    func getNumberOfStreams() -> Int {
        
        return topStreams.count
    }
    
    func getStreamAtIndex(atIndex index: Int) -> TTGStream {
        
        return topStreams[index]
    }
}
