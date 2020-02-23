//
//  ContentView.swift
//  navigationThroughAppState
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.activeView {
            case .more:
                   return AnyView(MoreView())
            case .home:
                   return AnyView(HomeView())
        }
    }
}


struct MoreView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("More view")
            Button(action: {
                sleep(1000) // wait 1 seconds
                print("go to vue Home")
                self.appState.activeView = .home
            }) {
            Text("aller à Home")
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("Home view")
            Button(action: {
                print("go to vue More")
                self.appState.activeView = .more
            }) {
            Text("aller à More")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
