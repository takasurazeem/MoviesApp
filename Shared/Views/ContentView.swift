

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""
    
    
    var body: some View {
        EmptyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        return ContentView().environmentObject(store)
    }
}

struct MovieCell: View {
    
    let movie: Movie
        
    var body: some View {
        EmptyView()
    }
}
