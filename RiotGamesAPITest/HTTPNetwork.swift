//
//  HTTPNetwork.swift
//  RiotGamesAPITest
//
//  Created by Byungwook Jeong on 2021/07/25.
//

import Foundation
import Alamofire

// ** HTTP Status Code **
// 400: Bad request
// 401: Unauthorized
// 403: Forbidden
// 404: Data not found
// 405: Method not allowed
// 415: Unsupported media type
// 429: Rate limit exceeded
// 500: Internal server error
// 502: Bad gateway
// 503: Service unavailable
// 504: Gateway timeout

class HTTPNetwork {
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func get(path: String, _ completion: @escaping (Any) -> Void) {
        let fullPath = baseUrl + path
        
        AF.request(fullPath)
            .validate(statusCode: [200])
            .responseJSON(queue: DispatchQueue.global()) { response in
            switch response.result {
                case .success(let obj):
                    completion(obj)
                case .failure(let err):
                    print(err.errorDescription ?? "Alamofire Response Error!")
            }
        }
    }
}
