//
//  ProfileNetworkable.swift
//  Rakwa
//
//  Created by heba isaa on 18/11/2021.
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
    func contact(firstname: String, lastname: String, email: String, message: String, phone: String, completion: @escaping (Result<BaseResponse<User>, Error>) -> ()) {
        request(target: .contact(firstname: firstname, lastname: lastname, email: email, message: message, phone: phone), completion: completion)
    }
}
