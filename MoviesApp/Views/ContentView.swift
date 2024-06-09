

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""
    let debouncer = Debouncer(delay: 0.3) // Adjust delay as needed

    
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
            TextField("Seach for movie name", text: $search, onCommit: {
                props.onSearch(search)
            })
            .textFieldStyle(.plain)
            .keyboardType(.alphabet)
            .padding()
            .onChange(of: search) { oldValue, newValue in
                if newValue.count > 2 {
                    debouncer.run {
                        props.onSearch(newValue)
                    }
                }
            }
            List(props.movies) { movie in
                NavigationLink {
                    MovieDetailsView(movie: movie)
                } label: {
                    MovieCell(movie: movie)
                }

            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
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
