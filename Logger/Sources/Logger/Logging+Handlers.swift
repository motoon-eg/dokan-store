//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 26/06/2022.
//

import Foundation

public func LogDebug(_ message: @autoclosure () -> String,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line,
                     logger: Logging = ShipBookLogger.shared) {
    logger.log(message(),
               level: .debug,
               file: file,
               function: function,
               line: line)
}

public func LogInfo(_ message: @autoclosure () -> String,
                    file: StaticString = #file,
                    function: StaticString = #function,
                    line: UInt = #line,
                    logger: Logging = ShipBookLogger.shared) {
    logger.log(message(),
               level: .info,
               file: file,
               function: function,
               line: line)
}

public func LogWarn(_ message: @autoclosure () -> String,
                    file: StaticString = #file,
                    function: StaticString = #function,
                    line: UInt = #line,
                    logger: Logging = ShipBookLogger.shared) {
    logger.log(message(),
               level: .warn,
               file: file,
               function: function,
               line: line)
}

public func LogVerbose(_ message: @autoclosure () -> String,
                       file: StaticString = #file,
                       function: StaticString = #function,
                       line: UInt = #line,
                       logger: Logging = ShipBookLogger.shared) {
    logger.log(message(),
               level: .verbose,
               file: file,
               function: function,
               line: line)
}

public func LogError(_ message: @autoclosure () -> String,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line,
                     logger: Logging = ShipBookLogger.shared) {
    logger.log(message(),
               level: .error,
               file: file,
               function: function,
               line: line)
}
