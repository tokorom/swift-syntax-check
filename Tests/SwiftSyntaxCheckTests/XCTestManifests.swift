import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swift_syntax_checkTests.allTests),
    ]
}
#endif
