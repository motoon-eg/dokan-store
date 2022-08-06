//
//  File.swift
//
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Alamofire
import Combine
import Foundation

/// Represents a collection of Remote Endpoints
///
public class Remote {

    /// Networking Wrapper: Dependency Injection Mechanism, useful for Unit Testing purposes.
    ///
    let network: Network

    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - credentials: Credentials to be used in order to authenticate every request.
    ///     - network: Network Wrapper, in charge of actually enqueueing a given network request.
    ///
    public init(network: Network) {
        self.network = network
    }

    /// Enqueues the specified Network Request.
    ///
    /// - Parameters:
    ///     - request: Request that should be performed.
    ///     - decoder: Decoder entity that will be used to attempt to decode the Backend's Response.
    ///     - completion: Closure to be executed upon completion.
    ///
    func enqueue<D: Decodable>(_ request: URLRequestConvertible,
                               decoder: JSONDecoder = JSONDecoder(),
                               completion: @escaping (Result<D, Error>) -> Void) {
        network.responseData(for: request) { result in
            switch result {
            case let .success(data):
                if let remoteError = RemoteErrorValidator.error(from: data) {
                    completion(.failure(remoteError))
                    return
                }

                do {
                    let decoded = try decoder.decode(D.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(failure):
                completion(.failure(failure))
            }
        }
    }

    /// Returns a publisher that enqueues the specified Network Request on subscription and emits the result upon completion.
    ///
    /// - Parameters:
    ///     - request: Request that should be performed.
    ///     - decoder: Decoder entity that will be used to attempt to decode the Backend's Response.
    ///
    /// - Returns: A publisher that emits result upon completion.
    func enqueue<D: Decodable>(_ request: URLRequestConvertible,
                               decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Result<D, Error>, Never> {
        network.responseDataPublisher(for: request)
            .map { result in
                switch result {
                case let .success(data):
                    if let remoteError = RemoteErrorValidator.error(from: data) {
                        return .failure(remoteError)
                    }

                    do {
                        let decoded = try decoder.decode(D.self, from: data)
                        return .success(decoded)
                    } catch {
                        return .failure(error)
                    }
                case let .failure(failure):
                    return .failure(failure)
                }
            }
            .eraseToAnyPublisher()
    }
}
