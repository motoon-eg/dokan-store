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
class AlamofireNetwork: Network {
    
    public init() { }
    
    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Data instance.
    ///
    func responseData(for request: URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(request).responseData { response in
            completion(response.result.toSwiftResult())
        }
    }
    
    /// Executes the specified Network Request. Upon completion, the payload or error will be emitted to the publisher.
    /// Only one value will be emitted and the request cannot be retried.
    ///
    func responseDataPublisher(for request: URLRequestConvertible) -> AnyPublisher<Result<Data, Error>, Never> {
        return Future { promise in
            AF.request(request).responseData { response in
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
