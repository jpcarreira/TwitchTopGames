//
//  TTGStreamCollectionViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 28/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit

class TTGStreamCollectionViewController: UICollectionViewController {

    var gameName: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(gameName!)
    }
    
}

// MARK: UICollectionViewDataSource
extension TTGStreamCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreamCell", for: indexPath)
        
        return cell
    }
}
