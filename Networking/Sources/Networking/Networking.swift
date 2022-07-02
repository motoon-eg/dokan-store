import Foundation
import Alamofire

public struct Networking {

    public init() {
    }
    
    public func perform<M: Decodable, T: TargetType>(target: T, responseClass: M.Type, completion: @escaping (Result<M, Error>) -> ()){
        let method = target.method.httpMethod
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0,encoding: params.1, headers: headers).response { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(NetworkingError.networkError(error)))
            case .success(_):
                guard let jsonResponse = try? response.result.get() else {
                    completion(.failure(NetworkingError.responseValidationFailed))
                    return
                }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    completion(.failure(NetworkingError.responseSerializationFailed))
                    return
                }
                guard let responseObject = try? JSONDecoder().decode(M.self, from: jsonData) else {
                    completion(.failure(NetworkingError.responseDecoderFailed))
                    return
                }
                completion(.success(responseObject))
            }
        }
    }
    
    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:],URLEncoding.default)
        case .requestParameters(parameters: let params, encoding: let encoding):
            return (params,encoding)
        }
    }
}

// MARK: - NetworkingError
//
private extension Networking {

    enum NetworkingError: LocalizedError {
        case networkError(Error)
        case responseValidationFailed
        case responseSerializationFailed
        case responseDecoderFailed
        
        /// Localized Text
        ///
        public var errorDescription: String? {
            switch self {
            case .networkError(let error):
                return "Invalid URL Or Connection error: \(error.localizedDescription)"
            case .responseValidationFailed:
                return "Response Validation failed"
            case .responseSerializationFailed:
                return "Response serialization failed"
            case .responseDecoderFailed:
                return "Response Decoder failed"
            }
        }
    }
}
