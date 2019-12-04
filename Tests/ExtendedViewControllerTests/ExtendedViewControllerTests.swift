import XCTest
@testable import ExtendedViewController

final class ExtendedViewControllerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ExtendedViewController().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
