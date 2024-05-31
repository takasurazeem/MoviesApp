//
//  MoviesReducer.swift
//  MoviesApp
//
//  Created by Takasur Home on 30/05/2024.
//

import Foundation

func moviesReducer(_ state: MoviesState, _ action: Action) -> MoviesState {
    var state = state
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
    default:
        break
    }
    return state
}
