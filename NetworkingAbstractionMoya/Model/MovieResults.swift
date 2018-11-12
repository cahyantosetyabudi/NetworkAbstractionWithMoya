//
//  MovieResults.swift
//  NetworkingAbstractionMoya
//
//  Created by Cahyanto Setya Budi on 11/12/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct MovieResults {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let movies: [Movie]
}

extension MovieResults: Decodable {
    enum ResultsCodingKeys: String, CodingKey {
        case page
        case numberOfResults
        case numberOfPages
        case movies
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        movies = try container.decode([Movie].self, forKey: .movies)
    }
}
