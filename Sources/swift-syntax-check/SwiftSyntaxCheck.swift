//
//  SwiftSyntaxCheck.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

class SwiftSyntaxCheck {
    var shPath = "/bin/sh"
    var swiftCommand = "swift"

    private let targetFilePath: String

    private lazy var command: SwiftCommand = SwiftCommand(
        shPath: shPath,
        swiftCommand: swiftCommand,
        targetFilePath: targetFilePath
    )

    init(for targetFilePath: String) {
        self.targetFilePath = targetFilePath
    }

    func run() {
        let lines = command.run()

        // ここでlinesを間引く
        let reduced = LineReducer().reduce(lines)

        command.write(reduced)
    }
}
