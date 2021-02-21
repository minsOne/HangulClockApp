import XCTest
@testable import Umbrella

final class UmbrellaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Umbrella().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
