//
//  ProfileManager.swift
//  DokanStore
//
//  Created by heba isaa on 24/06/2022.
//

import Foundation
import Moya
protocol ProfileNetworkable:Networkable{
    
func contact(firstname:String,lastname:String,email:String,message:String,phone:String,completion: @escaping (Result<BaseResponse<User>, Error>) -> ())
    
    
}
final class ProfileManager:ProfileNetworkable{


    var provider =  MoyaProvider<ProfileTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: ProfileManager = {
        let instance = ProfileManager()
        return instance
    }()
    
    typealias targetType = ProfileTarget
    func contact(firstname: String, lastname: String, email: String, message: String, phone: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .contact(firstname: firstname, lastname: lastname, email: email, message: message, phone: phone), completion: completion)
    }
}
