//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink("Old Navigation Demo") {
                OldNavigationDemo()
            }
            
            NavigationLink("New NavigationStack Demo") {
                NewNavigationDemo()
            }
        }
        .navigationTitle("Navigation Examples")
    }
}
