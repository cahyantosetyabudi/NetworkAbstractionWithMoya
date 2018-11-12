//
//  MovieAPI.swift
//  NetworkingAbstractionMoya
//
//  Created by Cahyanto Setya Budi on 11/12/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case recommended(id: Int)
    case popular(page: Int)
    case newMovies(page: Int)
    case video(id: Int)
}

extension MovieAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError("Base url not configured properly")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .recommended(let id):
            return "\(id)/recommendations"
        case .popular:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        }
    }
    
    var method: Moya.Method {
//        switch self {
//        case .addMovie:
//            return .post
//        case .editMovie:
//            return .patch
//        case .deleteMovie:
//            return .delete
//        default:
//            return .get
//        }
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .recommended, .video:
            return .requestParameters(parameters: ["api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        case .popular(let page), .newMovies(page: let page):
            return .requestParameters(parameters: ["page": page, "api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
