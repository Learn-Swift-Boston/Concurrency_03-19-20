import Vapor

final class InventoryController {
    func get(_ req: Request) throws -> Inventory {
        let id = try req.parameters.next(String.self)
        
        return Inventory(productId: id,
                         stock: Int.random(in: 0...10)) // it goes off the shelves as quick as we can stock it
    }
}
