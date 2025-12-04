//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navModel = NavigationViewModel()

    var body: some View {
        NavigationStack(path: $navModel.path) {
            
            List {
                Button("Old Navigation Demo") {
                    navModel.path.append(.detail)
                }

                Button("New Navigation Demo") {
                    navModel.path.append(.profile(id: 12))
                }
            }
            .navigationDestination(for: Screen.self, destination: destinationView)
        }
        /// You can listen to url deeplinking with .onOpenURL
        .onOpenURL { url in
            navModel.handleDeepLink(url)
        }
    }
    

    // MARK: - Routing Logic
    @ViewBuilder
    func destinationView(_ screen: Screen) -> some View {
        switch screen {
        case .detail:
            DetailView_New()
        case .profile(let id):
            ProfileView_New(userID: id)
        default:
            EmptyView()
        }
    }
}
