import Alamofire
import Foundation

public struct Networking {
    static let shared = Networking()

    public init() {
    }
    
    public func fetchAllProducts<T: Decodable>(completion: @escaping (Result<T?,Error>) -> Void){
        guard let url = URLs.shared.getProductsURL() else { return }
        
        let method = Alamofire.HTTPMethod(rawValue: HTTPMethod.get.rawValue)
        let headers = Alamofire.HTTPHeaders([:])
        
        AF.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: headers).response { response in
            switch response.result {
            case .failure(_):
                completion(.failure(GeneralErrors.callingAPI))
                
            case .success(_):
                guard let data = response.data else {return}
                do{
                    let jsonData = try JSONDecoder().decode(Products.self, from: data)
                    completion(.success(jsonData as? T))
                    print(jsonData)
                }catch{
                    completion(.failure(GeneralErrors.failedData))
                    print("Error")
                }
                
            }
        }
    }
    
}
