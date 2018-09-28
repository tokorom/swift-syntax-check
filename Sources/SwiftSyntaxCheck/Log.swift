//
//  Log.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

class Log {
    private static let stdout = FileHandle.standardOutput
    private static let stderr = FileHandle.standardError

    private static let ln: Data = "\n".data(using: .utf8)!

    static func error(_ error: Error) {
        print(error.localizedDescription, to: stderr)
    }

    static func print(_ message: String) {
        print(message, to: stdout)
    }

    private static func print(_ message: String, to fileHandle: FileHandle) {
        guard let data = message.data(using: .utf8) else {
            return
        }
        fileHandle.write(data)
        fileHandle.write(ln)
    }
}
