//
//  NewNavigationDemo.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import SwiftUI

struct NewNavigationDemo: View {
    @State private var path: [Screen] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {

                Button("Go to Detail") {
                    path.append(.detail)
                }

                Button("Go to Profile 42") {
                    path.append(.profile(id: 42))
                }

                Button("Deep Link → Profile 7 → Detail") {
                    path = [.profile(id: 7), .detail, .register, .payments]
                }
            }
            .navigationTitle("New Navigation")
            .navigationDestination(for: Screen.self, destination: destinationView)
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

// MARK: - Detail View
struct DetailView_New: View {
    var body: some View {
        VStack {
            Text("Detail View (New)")
                .font(.largeTitle)
        }
        .navigationTitle("Detail")
    }
}

// MARK: - Profile View
struct ProfileView_New: View {
    let userID: Int

    var body: some View {
        VStack {
            Text("Profile View")
            Text("User ID: \(userID)")
        }
        .navigationTitle("Profile")
    }
}
