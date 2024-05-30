

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
        case let action as FetchMovies:
            Task {
                do {
                    let movies = try await Webservice().getMoviesBy(search: action.search.urlEncode())
                    dispatch(SetMovies(movies: movies))
                } catch {
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
        
    }
    
}
