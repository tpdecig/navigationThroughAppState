//
//  ContentView.swift
//  navigationThroughAppState
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.

// Approche à la SwiftUI
// Une variable partagée (AppState.activeView) indique quelle vue doit être affichée.
// ContentView se contente donc simplement d'interroger AppState pour savoir quelle vue doit être montrée.
// En terme de navigation, ce mécanisme permet de passer de n'importe quelle vue à n'importe quelle autre vue, sans augmenter la taille de la pile des fenêtres affichées : la vue actuelle n'est simplement pu montrée, la nouvelle vue devient elle affichée quand on change la variable d'état qui indique quelle vue doit être affichée


import Foundation
import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        // Shows the view that is to be active according to AppState
        // by this enum mechanims, only one view can be shown at a time.
        switch appState.activeView {
            case .more:
                   return AnyView(MoreView())
            case .home:
                   return AnyView(HomeView())
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("Home view").font(.largeTitle); Spacer(); Text("(\(self.appState.nbOfSwitches) switches)") ; Spacer()
            Button(action: {
                print("manually goes to More View")
                self.appState.nbOfSwitches += 1
                self.appState.activeView = .more
            }) {
            Text("aller à More")
            }
        }
        // Avec ces changements successifs on peut aller très très loin (j'arrête le prog à 128525 switches)
        //.onAppear(perform: switchToMoreView)
    }
    private func switchToMoreView() {
        print("\(self.appState.nbOfSwitches) arrivee dans Home")
        //sleep(2)
        self.appState.nbOfSwitches += 1
        // goes automatically to other view
        self.appState.activeView = .more
       }
}

struct MoreView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("More view").font(.largeTitle); Spacer(); Text("(\(self.appState.nbOfSwitches) switches)") ; Spacer()
            Button(action: {
                print("manually goes to Home View")
                self.appState.nbOfSwitches += 1
                self.appState.activeView = .home
            }) {
            Text("aller à Home")
            }
        }
        // Avec ces changements successifs on peut aller très très loin (j'arrête le prog à 128525 switches)
        //.onAppear(perform: switchToHomeView)
    }
    private func switchToHomeView() {
        print("\(self.appState.nbOfSwitches) arrivee dans More")
        //sleep(2)
        self.appState.nbOfSwitches += 1
        // goes automatically to other view
        self.appState.activeView = .home
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
