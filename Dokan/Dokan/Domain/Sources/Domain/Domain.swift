

struct User :Decodable{
    let id:Int
    let email:String
    let username, firstname, lastname: String?
    let imageUrl: String?

}

protocol UserRepository{
    func fetchUserData() -> [User]
}

