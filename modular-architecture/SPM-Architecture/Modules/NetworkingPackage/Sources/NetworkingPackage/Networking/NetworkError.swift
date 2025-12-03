//
//  File.swift
//  NetworkingPackage
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed

    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "The request failed"
        case .invalidResponse: return "Invalid response"
        case .decodingFailed: return "Failed to decode the response"
        }
    }
}
