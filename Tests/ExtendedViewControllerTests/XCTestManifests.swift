import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ExtendedViewControllerTests.allTests),
    ]
}
#endif
