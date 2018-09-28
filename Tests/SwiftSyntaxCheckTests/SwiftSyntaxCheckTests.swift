import XCTest
import class Foundation.Bundle
@testable import SwiftSyntaxCheck

final class SwiftSyntaxCheckTests: XCTestCase {
    static var allTests = [
        ("testSimpleReduce", testSimpleReduce),
    ]

    func testSimpleReduce() throws {
        let lines = [
            "Tests/Sample.swift:10:16: error: \'.2\' is not a valid floating point literal; it must be written \'0.2\'",
            "    let arg1 = .2",
            "               ^~",
            "               0",
            "Tests/Sample.swift:7:8: error: no such module \'UIKit\'",
            "import UIKit",
            "       ^",
        ]

        let reduced = LineReducer().reduce(lines)

        XCTAssertEqual(reduced.count, 4)
        XCTAssertEqual(reduced[0], lines[0])
        XCTAssertEqual(reduced[3], lines[3])
    }
}
