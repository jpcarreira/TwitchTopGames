//
//  TTGGameCollectionViewCell.swift
//  TwitchTopGames
//
//  Created by João Carreira on 28/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit
import Kingfisher

class TTGGameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameTotalViewers: UILabel!
    
    var game: TTGGame? {
        
        didSet {
            
            if let game = game {
                
                gameImageView.kf.setImage(with: URL(string: game.boxImageLargeUrl!))
                gameTitle.text = game.name
                gameTotalViewers.text = String(describing: game.viewers!) + " viewers"
            }
        }
    }
    
    override func prepareForReuse() {
        
        gameImageView.image = nil
    }
}
