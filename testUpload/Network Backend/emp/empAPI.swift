//
//  empAPI.swift
//  testUpload
//
//  Created by Mohamed Ali on 22/10/2021.
//

import Foundation

protocol empAPIProtocol {
    func Addemp (value: [[String:Any]], completion: @escaping (Result<empResponse?,NSError>) -> Void)
}

class empAPI: BaseAPI<empNetworking>, empAPIProtocol {
    
    // MARK:- TODO:- this method For Add employee to databse.
    func Addemp (value: [[String:Any]], completion: @escaping (Result<empResponse?,NSError>) -> Void) {
        self.fetchData(Target: .add(value: value), ClassName: empResponse.self) { response in
            completion(response)
        }
    }
    // ------------------------------------------------
    
}
