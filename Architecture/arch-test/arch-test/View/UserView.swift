//
//  UserView.swift
//  arch-test
//
//  Created by Eduardo Hoyos on 3/11/25.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
