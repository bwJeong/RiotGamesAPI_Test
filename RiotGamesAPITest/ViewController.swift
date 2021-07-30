//
//  ViewController.swift
//  RiotGamesAPITest
//
//  Created by Byungwook Jeong on 2021/07/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = Repository()
        
        // 인게임 소환사들의 정보 확인
        repo.spectator(ingameSummonerName: "n3bular") { spectator in
            print(spectator)
        }
        
        // 소환사의 랭크 정보 확인
        repo.leagues(summonerName: "n3bular") { leagues in
            print(leagues)
        }
    }
}

