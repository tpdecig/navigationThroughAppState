//
//  AppState.swift
//  navigationThroughAppState
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var activeView: AppState.vue = .home
}



extension AppState {
    enum vue: Hashable {
        case home
        case more
    }
}
