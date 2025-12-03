//
//  File.swift
//  NetworkingPackage
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import Foundation

public struct Post: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let body: String
}
