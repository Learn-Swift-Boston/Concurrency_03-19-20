import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // MARK: Autogenerated Routes
    
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    // MARK: - Concurrency Routes
    let quoteController = QuoteController()
    router.get("quote", use: quoteController.randomQuote)
    
    let productController = ProductController()
    router.get("product", String.parameter, use: productController.get)
    
    let inventoryController = InventoryController()
    router.get("inventory", String.parameter, use: inventoryController.get)
}
