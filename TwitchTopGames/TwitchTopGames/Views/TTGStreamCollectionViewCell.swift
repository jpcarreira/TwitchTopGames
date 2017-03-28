//
//  TTGStreamCollectionViewCell.swift
//  TwitchTopGames
//
//  Created by João Carreira on 28/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit
import Kingfisher

class TTGStreamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var streamImageView: UIImageView!
    @IBOutlet weak var streamName: UILabel!
    @IBOutlet weak var streamTotalViewers: UILabel!
 
    var gameTitle: String?
    
    var stream: TTGStream? {
        
        didSet {
            
            if let stream = stream {
                
                streamImageView.kf.setImage(with: URL(string: stream.previewImageLargeUrl!))
                streamName.text = stream.channelName
                streamTotalViewers.text = String(describing: stream.viewers!) + " viewers"
            }
        }
    }
    
    override func prepareForReuse() {
        
        streamImageView.image = nil
    }
}
