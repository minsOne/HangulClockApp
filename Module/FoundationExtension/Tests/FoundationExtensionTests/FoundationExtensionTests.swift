import XCTest
@testable import FoundationExtension

final class FoundationExtensionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FoundationExtension().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
