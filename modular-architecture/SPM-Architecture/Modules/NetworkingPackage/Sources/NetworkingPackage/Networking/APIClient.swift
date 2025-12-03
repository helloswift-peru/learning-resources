//
//  File.swift
//  NetworkingPackage
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import Foundation

public final class APIClient {
    public init() {}

    public func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw NetworkError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
