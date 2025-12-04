//
//  NavigationViewModel.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import Combine
import SwiftUI

@MainActor
class NavigationViewModel: ObservableObject {
    @Published var path: [Screen] = []

    /**
     Command to  execute in terminal, while the simulator is turned on
     # xcrun simctl openurl booted "navigationstackdemo://profile/detail/42"
     */
    /// Handles links for redirecting inside the app
    func handleDeepLink(_ url: URL) {
        let components = url.pathComponents.filter { $0 != "/" }

        guard let first = components.first else { return }

        switch first {
        case "detail":
            if components.count >= 2, let id = Int(components[1]) {
                path.append(Screen.profile(id: id))
            }

        default:
            break
        }
    }
}
