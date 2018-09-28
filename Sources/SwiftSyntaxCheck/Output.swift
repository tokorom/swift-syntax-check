//
//  Log.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

public let stdout: FileHandle = FileHandle.standardOutput
public let stderr: FileHandle = FileHandle.standardError

private let ln: Data = "\n".data(using: .utf8)!

extension FileHandle {
    public func error(_ error: Error) {
        printLn(error.localizedDescription)
    }

    public func print(_ message: String) {
        printLn(message)
    }

    private func printLn(_ message: String) {
        guard let data = message.data(using: .utf8) else {
            return
        }

        write(data)
        write(ln)
    }
}
