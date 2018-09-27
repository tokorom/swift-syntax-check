import Foundation

class SwiftCommand {
    let process: Process
    let pipe = Pipe()

    init(shPath: String, swiftCommand: String, targetFilePath: String) {
        let process = Process()

        process.launchPath = shPath
        process.arguments = ["-c", "\(swiftCommand) \(targetFilePath)"]

        process.standardOutput = pipe
        process.standardError = pipe

        self.process = process
    }

    func run() -> [String] {
        process.launch()

        let reader = pipe.fileHandleForReading
        var output = ""

        while true {
            let data = reader.availableData

            guard data.count > 0 else {
                break
            }

            guard let got = String(data: data, encoding: .utf8) else {
                continue
            }

            output += got
        }

        return output.split(separator: "\n").map { String($0) }
    }

    func write(_ lines: [String]) {
        let writer = FileHandle.standardOutput

        let output = lines.joined(separator: "\n")

        guard let data = output.data(using: .utf8) else {
            return
        }

        writer.write(data)
    }
}

class SwiftSyntaxCheck {
    var shPath = "/bin/sh"
    var swiftCommand = "swift"

    func run(with filePath: String) {
        let command = SwiftCommand(
            shPath: shPath,
            swiftCommand: swiftCommand,
            targetFilePath: filePath
        )

        let lines = command.run()

        // ここでlinesを間引く

        command.write(lines)
    }
}

// main

func main() {
    let args = CommandLine.arguments.dropFirst()
    for targeFile in args {
        let runner = SwiftSyntaxCheck()
        runner.run(with: targeFile)
    }
}

main()

exit(0)
