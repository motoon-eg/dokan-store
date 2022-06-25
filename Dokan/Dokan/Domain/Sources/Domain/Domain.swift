

struct User :Decodable{
    let id:Int?
    let username, firstname, lastname, email: String?
    let imageUrl: String?

}

protocol DomainRepository{
    func fetchUserData() -> [User]
}

