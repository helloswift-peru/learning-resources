//
//  Screen.swift
//  NavigationStackDemo
//
//  Created by Eduardo Hoyos on 3/12/25.
//

import Foundation

enum Screen: Hashable {
    case detail
    case profile(id: Int)
    case payments
    case history
    case settings
    case login
    case register
    case welcome
    case unknown(String)
}

// Destination.profile(input)
struct ProfileInput {
    let name: String
    let lastname: String
}
