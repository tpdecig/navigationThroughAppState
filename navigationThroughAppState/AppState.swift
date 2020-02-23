//
//  AppState.swift
//  navigationThroughAppState
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

// Stores the current view to show
// All views are listed in an enum
// The way to go freely from a current view to any chosen view is just
//     to change the activeView property in the current view to indicate the view we want to go
//     (see ContentView big switch)

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var activeView: AppState.vue = .home
    @Published var nbOfSwitches: Int = 0
}



extension AppState {
    enum vue: Hashable {
        case home
        case more
    }
}
