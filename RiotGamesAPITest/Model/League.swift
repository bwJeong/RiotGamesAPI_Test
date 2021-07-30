//
//  League.swift
//  RiotGamesAPITest
//
//  Created by Byungwook Jeong on 2021/07/30.
//

import Foundation

struct League: Codable {
    let queueType: String
    let tier: String
    let rank: String
}

extension League {
    static let empty = League(queueType: "N/A", tier: "N/A", rank: "N/A")
}
