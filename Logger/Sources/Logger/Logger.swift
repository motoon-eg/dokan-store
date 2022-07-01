public struct DefaultLogger: Logging {
    public static let shared = DefaultLogger()
    
    public init() {
        
    }
    
    public func log(_ message: @autoclosure () -> String,
                    level: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line: UInt) {
        #warning("Implement logger")
        print(message())
    }
}
