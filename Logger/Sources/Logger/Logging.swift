//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 26/06/2022.
//

import Foundation

/// Represents a logger blueprint
///
public protocol Logging {
    
    /// Log a message
    ///
    /// - Parameters:
    ///   - message: To be logged message
    ///   - level: Log level
    ///   - file: File name. Default is caller file name.
    ///   - function: Function name, Default is caller function name.
    ///   - line: Invoke line. Default is invoke line number.
    func log(_ message: @autoclosure () -> String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt)
}
