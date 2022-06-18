import Foundation
import Alamofire
import Combine

public protocol Network {
    
    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Decodable instance.
    ///
    func responseDecodable<T: Decodable>(for request: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void)
    
    /// Executes the specified Network Request. Upon completion, the payload or error will be emitted to the publisher.
    /// Only one value will be emitted and the request cannot be retried.
    ///
    func responseDecodablePublisher<T: Decodable>(for request: URLRequestConvertible) -> AnyPublisher<Result<T, Error>, Never>
}
