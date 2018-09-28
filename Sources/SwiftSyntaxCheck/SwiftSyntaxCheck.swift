//
//  SwiftSyntaxCheck.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

public class SwiftSyntaxCheck {
    public var shPath = "/bin/sh"
    public var swiftCommand = "swift"

    private let targetFilePath: String

    private lazy var command: SwiftCommand = SwiftCommand(
        shPath: shPath,
        swiftCommand: swiftCommand,
        targetFilePath: targetFilePath
    )

    public init(for targetFilePath: String) {
        self.targetFilePath = targetFilePath
    }

    public func run() {
        let lines = command.run()

        // ここでlinesを間引く
        let reduced = LineReducer().reduce(lines)

        command.write(reduced)
    }
}
