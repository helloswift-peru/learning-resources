//
//  OldNavigationDemo.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import SwiftUI

struct OldNavigationDemo: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Go to Detail") {
                    DetailView_Old()
                }

                NavigationLink("Go to Profile 42") {
                    ProfileView_Old(userID: 42)
                }
            }
            .navigationTitle("Old Navigation")
        }
    }
}

// MARK: - Detail View
struct DetailView_Old: View {
    var body: some View {
        VStack {
            Text("Detail View (Old)")
                .font(.largeTitle)
        }
        .navigationTitle("Detail")
    }
}

// MARK: - Profile View
struct ProfileView_Old: View {
    let userID: Int

    var body: some View {
        VStack {
            Text("Profile View")
            Text("User ID: \(userID)")
        }
        .navigationTitle("Profile")
    }
}
