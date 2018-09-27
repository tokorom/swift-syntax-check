//
//  SwiftSyntaxCheck.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

class SwiftSyntaxCheck {
    let targetFilePath: String

    var shPath = "/bin/sh"
    var swiftCommand = "swift"

    lazy var command: SwiftCommand = SwiftCommand(
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

        command.write(lines)
    }
}
