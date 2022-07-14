import ShipBookSDK

public struct ShipBookLogger: Logging {
    public static let shared = ShipBookLogger()

    private init() {
        ShipBook.start(appId:"62c58b01cce7cd701efdfa09",
                       appKey:"47acafe6f0cd03591eb0efc0eb1fb9f2")
    }
    
    public func log(_ message: @autoclosure () -> String,
                    level: LogLevel,
                    file: StaticString,
                    function: StaticString,
                    line: UInt) {
        switch level {
        case .verbose:
            Log.v(message(), function: function.description, file: file.description, line: Int(line))
        case .debug:
            Log.d(message(), function: function.description, file: file.description, line: Int(line))
        case .info:
            Log.i(message(), function: function.description, file: file.description, line: Int(line))
        case .warn:
            Log.w(message(), function: function.description, file: file.description, line: Int(line))
        case .error:
            Log.e(message(), function: function.description, file: file.description, line: Int(line))
        }
    }
}
