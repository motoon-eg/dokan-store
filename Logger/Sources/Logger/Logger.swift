public struct Logger: Logging {
    public static let `default` = Logger()
    
    public init() {
        
    }
    
    public func log(_ message: @autoclosure () -> String,
                    level: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line: UInt) {
        #warning("Implement logger")
    }
}
