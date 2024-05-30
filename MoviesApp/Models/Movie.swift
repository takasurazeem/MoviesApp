//
//  Movie.swift
//  MoviesApp
//
//  Created by Takasur Home on 30/05/2024.
//  Copyright © 2024 Takasur Azeem. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let poster: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}

