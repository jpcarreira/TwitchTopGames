//
//  ViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 25/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        TTGTwitchClient.singleton.getTopGames { (success, topGames) in
            
            if success {
                
                print(topGames ?? "no games")
            }
        }
    }
}
