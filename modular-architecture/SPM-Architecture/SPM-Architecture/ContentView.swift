//
//  ContentView.swift
//  SPM-Architecture
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import SwiftUI
import NetworkingPackage

struct ContentView: View {
    
    let api = APIClient()
    
    var body: some View {
        Text("Ready!")
            .task {
                struct PostsEndpoint: Endpoint {
                    let baseURL = "https://jsonplaceholder.typicode.com"
                    let path = "/posts/1"
                    let method = "GET"
                }

                do {
                    let post: Post = try await api.fetch(Post.self, from: PostsEndpoint())
                    print(post)
                } catch {
                    print("Error: \(error)")
                }
            }
    }
}

#Preview {
    ContentView()
}
