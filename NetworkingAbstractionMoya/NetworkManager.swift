//
//  NetworkManager.swift
//  NetworkingAbstractionMoya
//
//  Created by Cahyanto Setya Budi on 11/12/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> {get}
}

struct NetworkManager {
    static let MovieAPIKey = "7a312711d0d45c9da658b9206f3851dd"
    let provider = MoyaProvider<MovieAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getNewMovies(page: Int, completion: @escaping ([Movie])->()) {
        provider.request(.newMovies(page: page)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
                    completion(results.movies)
                } catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
