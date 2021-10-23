//
//  empNetworking.swift
//  testUpload
//
//  Created by Mohamed Ali on 22/10/2021.
//

import Foundation
import Alamofire

enum empNetworking {
    case add (value: [[String:Any]])
}

extension empNetworking: TargetType {
    var baseURL: String {
        return baseurl
    }
    
    var path: String {
        return userEndPoint
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var task: Task {
        switch self {
        case .add(let value):
            let params = ["value": value]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
