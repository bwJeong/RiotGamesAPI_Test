//
//  Repository.swift
//  RiotGamesAPITest
//
//  Created by Byungwook Jeong on 2021/07/25.
//

import Foundation
import SwiftyJSON

struct Repository {
    let httpNetwork = HTTPNetwork(baseUrl: "https://kr.api.riotgames.com/lol")
    let apiKey = "YOUR_API_KEY"
    
    private func summonerId(summonerName: String, completion: @escaping (String) -> Void) {
        let path = "/summoner/v4/summoners/by-name/" + summonerName + "?api_key=\(apiKey)"
        
        guard let percentEncondedPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Percent Encoding Error!")
        }
        
        httpNetwork.get(path: percentEncondedPath) { obj in
            let json = JSON(obj)
            
            completion(json["id"].stringValue)
        }
    }
    
    func spectator(ingameSummonerName: String, completion: @escaping (Spectator) -> Void) {
        summonerId(summonerName: ingameSummonerName) { id in
            let path = "/spectator/v4/active-games/by-summoner/" + id + "?api_key=\(apiKey)"
            
            httpNetwork.get(path: path) { obj in
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    let spectator = try JSONDecoder().decode(Spectator.self, from: jsonData)
                    
                    completion(spectator)
                } catch let err {
                    print(String(describing: err))
                }
            }
        }
    }
    
    func leagues(summonerName: String, completion: @escaping ([League]) -> Void) {
        summonerId(summonerName: summonerName) { id in
            let path = "/league/v4/entries/by-summoner/" + id + "?api_key=\(apiKey)"
            
            httpNetwork.get(path: path) { obj in
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    let leagues = try JSONDecoder().decode([League].self, from: jsonData)
                    
                    completion(leagues)
                } catch let err {
                    print(String(describing: err))
                }
            }
        }
    }
}
