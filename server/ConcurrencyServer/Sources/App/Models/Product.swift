import Vapor

struct Product: Content {
    var id: String
    var name: String
    var description: String
    var imageUrl: String
}

