import Vapor

struct Inventory: Content {
    var productId: String
    var stock: Int
}
