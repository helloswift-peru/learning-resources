//
//  File.swift
//  NetworkingPackage
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import Foundation

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
}

public extension Endpoint {
    var url: URL? {
        URL(string: baseURL + path)
    }
}
