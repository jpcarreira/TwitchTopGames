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
        
        // TODO: remove, remove
        JCNetworkWrapper.get(NSURL(string: "https://api.twitch.tv/kraken/channels/twitch") as! URL, headers: ["Client-ID":"wnkbmfji4ygkb5jw9z4bmy605wf61o"], parameters: nil) { (json, error) in
            
            if let json = json {
                
                print(json)
            }
        }
    }
    
}
