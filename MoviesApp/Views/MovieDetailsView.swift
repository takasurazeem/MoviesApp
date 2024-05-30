

import SwiftUI

struct MovieDetailsView: View {
    
    @EnvironmentObject var store: Store<AppState>
    
    let movie: Movie
    
    var body: some View {
        EmptyView()
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        
        return MovieDetailsView(movie: Movie(title: "Batman", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdbId: "tt4853102"))
            .environmentObject(store)
    }
}
