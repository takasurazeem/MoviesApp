

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    func map(state: MoviesState) -> Props {
        Props(movies: state.movies) { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        return VStack {
            TextField("Seach for movie name", text: $search)
                .textFieldStyle(.roundedBorder)
            List(props.movies) { movie in
                Text(movie.title)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(
            reducer: appReducer,
            state: AppState(),
            middlewares: [moviesMiddleware()]
        )
        return ContentView().environmentObject(store)
    }
}

struct MovieCell: View {
    
    let movie: Movie
        
    var body: some View {
        EmptyView()
    }
}
