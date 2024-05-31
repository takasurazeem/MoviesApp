//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Takasur Home on 31/05/2024.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
        
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            
            Text(movie.title)
        }
    }
}

#Preview {
    MovieCell(
        movie: Movie(
            title: "Batman Begins",
            poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
            imdbId: "tt0372784"
        )
    )
}
