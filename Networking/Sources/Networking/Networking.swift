import Alamofire
import Foundation

public struct Networking {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func fetchAllProducts<T: Codable>(expectingReturnType: T.Type, completion: @escaping ((Result<T?,Error>) -> Void)){
        guard let url = URL(string: Constans.baseUrl + DokanAPI.getAllProducts.path) else { return }
        let method = DokanAPI.getAllProducts.method
        let headers = DokanAPI.getAllProducts.headers
        let params = DokanAPI.getAllProducts.parameters

            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).response { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(_):
                    guard let data = response.data else {return}
                    do{
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(jsonData))
                    }catch{
                        completion(.failure(error))
                    }

                }
            }
        }
}

