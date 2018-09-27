import Foundation

// main

func main() {
    let args = CommandLine.arguments.dropFirst()
    for targetFile in args {
        let runner = SwiftSyntaxCheck(for: targetFile)
        runner.run()
    }
}

main()

exit(0)
