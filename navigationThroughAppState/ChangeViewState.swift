//
//  ChangeViewState.swift
//  navigationThroughAppState
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// Une vue qui essaye de changer de vue, mais l'UI ne suit pas : elle attend la dernière instruction de la boucle pour modifier son affichage, donc on ne voit pas les changements s'opérer, uniquement le final.

struct ChangeViewState: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("Change views reapeatdly!")
            Button(action: {
                for i in 1...9 {
                    //sleep(1)
                    //let delai = 1.0 //1.5
                    //DispatchQueue.main.asyncAfter(deadline: .now() + delai) {
                    // Put your code which should be executed with a delay here
                        print ("i=\(i)")
                        if (self.appState.activeView == .more) {
                            print("go to vue Home")
                            self.appState.activeView = .home
                        }
                        else {
                            print("go to vue More")
                            self.appState.activeView = .more
                        }
                    //}
                }
            }) {
            Text("aller à Home")
            }
        }
    }
}
