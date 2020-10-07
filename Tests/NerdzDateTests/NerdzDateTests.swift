import XCTest
@testable import NerdzDate

final class NerdzDateTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NerdzDate().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
