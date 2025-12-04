//
//  ContentView.swift
//  DemoHello
//
//  Created by Johann Francisco Jara Sanchez on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    private let appContainer = AppContainer()

    var body: some View {
        CartView(appContainer: appContainer)
    }
}

#Preview {
    ContentView()
}
