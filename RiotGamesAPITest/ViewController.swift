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
        
        // 현재 인게임을 진행중인 소환사명을 입력
        repo.spectator(ingameSummonerName: "n3bular") { spectator in
            print(spectator)
        }
    }
}

