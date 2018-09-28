import Foundation

// main

func main(args: [String]) {
    for targetFile in args {
        let runner = SwiftSyntaxCheck(for: targetFile)
        runner.run()
    }
}

main(args: Array(CommandLine.arguments.dropFirst()))

exit(0)
