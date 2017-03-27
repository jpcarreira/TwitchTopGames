//
//  ViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 25/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit

class TTGGamesViewController: UICollectionViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // small tweak in collection view layout
        let width = collectionView!.frame.width / 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        
        TTGTwitchClient.singleton.getTopGames(withLimit: 7) { (success, topGames) in
            
            if success {
                
                print(topGames ?? "no games")
            
            } else {
                
                print("some error occured")
            }
        }
        
        TTGTwitchClient.singleton.getTopStreams(forGame: "Alien: Isolation", withLimit: 4) { (success, topStreams) in
            
            if success {
                
                print(topStreams ?? "no streams")
            
            } else {
                
                print("some error occured")
            }
        }
    }
}

// MARK - UICollectionViewDataSource
extension TTGGamesViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // TODO:
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath)
        
        return gameCell
    }
}

