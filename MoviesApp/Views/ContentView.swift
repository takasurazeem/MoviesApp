

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
                .padding()
            List(props.movies) { movie in
                MovieCell(movie: movie)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
        .onAppear {
            props.onSearch("lion king")
        }
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
