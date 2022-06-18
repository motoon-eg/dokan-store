//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Foundation
import Combine
import Alamofire

/// AlamofireWrapper: Encapsulates all of the Alamofire OP's
///
struct AlamofireNetwork: Network {
    
    public init() { }
    
    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Decodable instance.
    ///
    public func responseDecodable<T: Decodable>(for request: Alamofire.URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(request).responseDecodable(of: T.self) { response in
            completion(response.result.toSwiftResult())
        }
    }
        
    /// Executes the specified Network Request. Upon completion, the payload or error will be emitted to the publisher.
    /// Only one value will be emitted and the request cannot be retried.
    ///
    public func responseDecodablePublisher<T: Decodable>(for request: URLRequestConvertible) -> AnyPublisher<Result<T, Error>, Never> {
        return Future { promise in
            AF.request(request).responseDecodable(of: T.self) { response in
                let result = response.result.toSwiftResult()
                promise(.success(result))
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: - Swift.Result Conversion
//
private extension Result where Failure == AFError {
    /// Convert this `Alamofire.Result` to a `Swift.Result`.
    ///
    func toSwiftResult() -> Swift.Result<Success, Error> {
        switch self {
        case .success(let value):
            return .success(value)
        case .failure(let error):
            return .failure(error)
        }
    }
}
