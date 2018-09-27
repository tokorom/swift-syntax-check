import Foundation

struct Log {
    private static let stdout = FileHandle.standardOutput
    private static let stderr = FileHandle.standardError

    private static let ln = "\n".data(using: .utf8)!

    static func print(_ object: Any) {
        guard let data = "\(object)".data(using: .utf8) else {
            return
        }
        stdout.write(data)
        stdout.write(ln)
    }

    static func error(_ message: String) {
        guard let data = message.data(using: .utf8) else {
            return
        }
        stderr.write(data)
        stderr.write(ln)
    }
}

class SwiftCommand {
    let process: Process

    init(commandPath: String, targetFilePath: String) {
        let process = Process()

        process.launchPath = commandPath
        process.arguments = [targetFilePath]

        self.process = process
    }

    func run() {
        process.launch()
    }
}

class SwiftRunner {
    var commandPath: String = "/usr/bin/swift"

    func run(with filePath: String) {
        let command = SwiftCommand(
            commandPath: commandPath,
            targetFilePath: filePath
        )
        command.run()
    }
}

// main

func main() {
    let args = CommandLine.arguments.dropFirst()
    for targeFile in args {
        let runner = SwiftRunner()
        runner.run(with: targeFile)
    }
}

main()

exit(0)
