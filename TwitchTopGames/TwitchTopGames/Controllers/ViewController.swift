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
