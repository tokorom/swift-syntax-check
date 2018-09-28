//
//  LineReducer.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

public class LineReducer {
    public init() {
    }

    public func reduce(_ lines: [String]) -> [String] {
        let firstLineRegex: NSRegularExpression
        do {
            firstLineRegex = try NSRegularExpression(pattern: "^[^:]+:[0-9]+:[0-9]+: ")
        } catch let error {
            stderr.error(error)
            return []
        }

        var inSkipMode = false

        return lines.filter { line in
            let range = NSRange(location: 0, length: line.count)

            if firstLineRegex.firstMatch(in: line, range: range) == nil {
                // this is a supplementary line
                if inSkipMode {
                    // skip
                    return false
                } else {
                    return true
                }
            }

            for pattern in IgnorePattern.allCases {
                do {
                    let regex = try NSRegularExpression(pattern: pattern.rawValue)
                    if regex.firstMatch(in: line, range: range) != nil {
                        inSkipMode = true
                        return false
                    }
                } catch let error {
                    stderr.error(error)
                }
                continue
            }

            inSkipMode = false
            return true
        }
    }
}
