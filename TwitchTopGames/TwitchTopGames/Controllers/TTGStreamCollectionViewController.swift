//
//  TTGStreamCollectionViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 28/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit

class TTGStreamCollectionViewController: UICollectionViewController {

    fileprivate var streamDataSource = TTGStreamDataSource()
    
    var gameName: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        streamDataSource.delegate = self
        
        if let gameName = gameName {
            
            streamDataSource.fetchStreamData(forGame: gameName)
        }
        
        // small tweak in collection view layout
        let width = collectionView!.frame.width
        let height = collectionView!.frame.height / 3   
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
}

// MARK: UICollectionViewDataSource
extension TTGStreamCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return streamDataSource.getNumberOfStreams()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreamCell", for: indexPath) as! TTGStreamCollectionViewCell
        let stream = streamDataSource.getStreamAtIndex(atIndex: indexPath.row)
        cell.stream = stream
        
        return cell
    }
}

extension TTGStreamCollectionViewController: TTGStreamDataSourceDelegate {
    
    func didFinishRequest() {
        
        DispatchQueue.main.async {
            
            self.collectionView?.reloadData()
        }
    }
}
