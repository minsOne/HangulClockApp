import XCTest
@testable import HangulClockTable

final class HangulClockTableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HangulClockTable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
