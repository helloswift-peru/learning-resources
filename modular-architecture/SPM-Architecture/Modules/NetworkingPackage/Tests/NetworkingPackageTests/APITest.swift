//
//  File.swift
//  NetworkingPackage
//
//  Created by Daniel Enrique Vergara Cornelio on 2/12/25.
//

import XCTest
@testable import NetworkingPackage

final class APITests: XCTestCase {

    func testHello() {
        let pkg = NetworkingPackage()
        XCTAssertEqual(pkg.hello(), "Hello from MyAdvancedPackage!")
    }

    func testDecodeLocalJSON() throws {
        let url = Bundle.module.url(forResource: "mock_response", withExtension: "json")
        XCTAssertNotNil(url)

        let data = try Data(contentsOf: url!)
        let post = try JSONDecoder().decode(Post.self, from: data)

        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Test Post")
    }
}
