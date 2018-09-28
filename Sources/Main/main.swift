import Foundation
import SwiftSyntaxCheck
import Utility

// options

let parser = ArgumentParser(
    usage: "swift-syntax-check filePath[s]",
    overview: "Simply check the swift code syntax"
)

let binder = ArgumentBinder<Option>()

binder.bindArray(
    positional: parser.add(
        positional: "filePath[s]",
        kind: [String].self,
        strategy: .upToNextOption,
        usage: "Path to target file"
    ),
    to: { option, paths in
        option.filePaths = paths
    }
)

binder.bind(
    option: parser.add(
        option: "--swiftpath",
        shortName: "-s",
        kind: String.self,
        usage: "Path to swift command"
    ),
    to: { option, swiftPath in
        option.swiftPath = swiftPath
    }
)

do {
    let result =  try parser.parse(Array(CommandLine.arguments.dropFirst()))

    var option = Option()
    try binder.fill(parseResult: result, into: &option)

    let runner = SwiftSyntaxCheck.Runner(option)
    runner.run()
} catch let error {
    stderr.error(error)
}

exit(0)
