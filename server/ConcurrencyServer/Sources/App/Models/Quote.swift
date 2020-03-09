import Vapor

struct Quote: Content {
    var quote: String
    var author: String
}
