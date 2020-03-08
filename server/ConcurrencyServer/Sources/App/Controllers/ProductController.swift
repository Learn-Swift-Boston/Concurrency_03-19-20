import Vapor

final class ProductController {
    func get(_ req: Request) throws -> Product {
        let id = try req.parameters.next(String.self)
        
        return Product(id: id,
                       name: "Purell Hand Sanitizer",
                       description: "The best, most price gouged, tool for fighting pandemics. Now sold in partial bottles. Note some partial bottles were collected from trash cans. So please use Purell Bottle Sanitizer™ to sanitizer your hand sanitizer before and after sanitizing your hands.",
                       imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/9/96/Purell_8_fl_oz_bottle.jpg/160px-Purell_8_fl_oz_bottle.jpg")
    }
}

/*
 {
     "id": "123",
     "image": "http.comurl.com"
     "description": "something brief"
 }

 */
