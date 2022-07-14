// This file bridges logging commands from the current module to our logging
// library. You can call any Log… function from any Swift file in this module
// without having to import Logger manually.
//
// This file should be copied into or included in any module where we want to
// provide this functionality.
//
// The overhead of this indirection should be zero because the compiler
// should inline all calls. (We could annotate the functions with
// `@inline(__always)` to enfore inlining, but that attribute is not officially
// supported as of Swift 4.0.)
// swiftlint:disable identifier_name

import Logger

@inline(__always)
public func LogDebug(_ message: @autoclosure () -> String,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line) {
    Logger.LogDebug(message(),
                     file: file,
                     function: function,
                     line: line)
}

@inline(__always)
public func LogInfo(_ message: @autoclosure () -> String,
                    file: StaticString = #file,
                    function: StaticString = #function,
                    line: UInt = #line) {
    Logger.LogInfo(message(),
                    file: file,
                    function: function,
                    line: line)
}

@inline(__always)
public func LogWarn(_ message: @autoclosure () -> String,
                    file: StaticString = #file,
                    function: StaticString = #function,
                    line: UInt = #line) {
    Logger.LogWarn(message(),
                    file: file,
                    function: function,
                    line: line)
}

@inline(__always)
public func LogVerbose(_ message: @autoclosure () -> String,
                       file: StaticString = #file,
                       function: StaticString = #function,
                       line: UInt = #line) {
    Logger.LogVerbose(message(),
                       file: file,
                       function: function,
                       line: line)
}

@inline(__always)
public func LogError(_ message: @autoclosure () -> String,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line) {
    Logger.LogError(message(),
                     file: file,
                     function: function,
                     line: line)
}
