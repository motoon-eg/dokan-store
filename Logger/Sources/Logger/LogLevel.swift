//
//  File.swift
//
//
//  Created by Ahmed M. Hassan on 26/06/2022.
//

import Foundation

/// Telling how important a given log message is.
///
public enum LogLevel {

    /// When you need full visibility of what is happening in your application.
    ///
    case verbose

    /// should be used for information that may be needed for diagnosing issues and troubleshooting or
    /// when running application in the test environment for the purpose of making sure everything is
    /// running correctly
    case debug

    /// Standard log level indicating that something happened, the application entered a certain state, etc.
    ///
    case info

    /// Indicates that something unexpected happened in the application, a problem, or a situation that
    /// might disturb one of the processes. But that doesn’t mean that the application failed.
    ///
    case warn

    /// Should be used when the application hits an issue preventing one or more functionalities from
    /// properly functioning.
    case error
}
