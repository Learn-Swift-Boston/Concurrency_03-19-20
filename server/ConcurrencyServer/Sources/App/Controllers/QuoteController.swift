import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class QuoteController {
    func randomQuote(_ req: Request) throws -> Quote {
        
        sleep(5) // simulate server slowness
        let quotes: [Quote] = [
            Quote(quote: "There are only two kinds of programming language: the kind everybody complains about and the kind nobody uses.",
                  author: "Bjarne Stroustrup"),
            Quote(quote: "My goal for Swift has always been and still is total world domination. It’s a modest goal.",
                  author: "Chris Lattner"),
            Quote(quote: "If you can write software, you can build anything you can imagine, putting you in a position where you can really impact people’s lives positively.",
                  author: "Jon-Tait “Jazbo” Beason"),
            Quote(quote: "The word queue is ironic. It's just q with a bunch of silent letters waiting in line.",
                  author: "Erica Sadun"),
        ]
        
        return quotes.random!
    }
}
