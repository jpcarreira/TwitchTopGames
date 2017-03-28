//
//  TTGGamesViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 25/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit
import Kingfisher

class TTGGamesViewController: UICollectionViewController {
    
    fileprivate var gamesDataSource = TTGGamesDataSource()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        gamesDataSource.delegate = self
    
        // small tweak in collection view layout
        let width = collectionView!.frame.width / 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
}

// MARK - UICollectionViewDataSource
extension TTGGamesViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return gamesDataSource.getNumberOfGames()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! TTGGameCollectionViewCell
        gameCell.game = gamesDataSource.getGame(atIndex: indexPath.row)
        
        return gameCell
    }
}

// MARK - TTGGameDataSourceDelegate
extension TTGGamesViewController: TTGGameDataSourceDelegate {
    
    func didFinishRequest() {
        
        DispatchQueue.main.async {
            
            self.collectionView?.reloadData()
        }
    }
}
