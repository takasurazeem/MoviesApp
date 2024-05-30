//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Takasur Home on 30/05/2024.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var body: some Scene {
       
        let store = Store(
            reducer: appReducer,
            state: AppState(),
            middlewares: [moviesMiddleware()]
        )
        
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
