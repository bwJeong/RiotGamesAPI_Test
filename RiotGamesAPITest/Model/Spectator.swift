//
//  Spectator.swift
//  RiotGamesAPITest
//
//  Created by Byungwook Jeong on 2021/07/25.
//

import Foundation

struct Spectator: Codable {
    let participants: [Participant]
}

struct Participant: Codable {
    let teamId: Int
    let spell1Id: Int
    let spell2Id: Int
    let championId: Int
    let summonerName: String
    let perks: Perks
}

struct Perks: Codable {
    let perkIds: [Int]
    
    func isCosmicInsightActive() -> Bool {
        // 8347: 우주적 통찰력(Cosmic Insight)
        // 소환사 주문 가속 + 18, 아이템 가속 + 10
        
        return perkIds.contains(8347) ? true : false
    }
}
