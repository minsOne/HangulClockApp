import XCTest
@testable import MainScene

final class MainSceneTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MainScene().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
