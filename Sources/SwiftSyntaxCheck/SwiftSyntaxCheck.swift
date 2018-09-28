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

    public func start() {
        let lines = command.run()

        let reduced = LineReducer().reduce(lines)

        for line in reduced {
            stdout.print(line)
        }
    }
}

// MARK: - Runner

extension SwiftSyntaxCheck {
    public struct Runner {
        private let option: Option

        public init(_ option: Option) {
            self.option = option
        }

        public func run() {
            for targetFile in option.filePaths {
                let check = SwiftSyntaxCheck(for: targetFile)
                check.start()
            }
        }
    }
}
