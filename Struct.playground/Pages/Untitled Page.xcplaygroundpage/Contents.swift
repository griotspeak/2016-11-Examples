import Foundation

struct Location {
    let x: Int
    let y: Int

    // Writing *an* initializer forfeits 'free' initializers for structs.
    init() {
        self.x = 0
        self.y = 0
    }

    // you are allowed to have more than one initializer
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    var distanceFromOrigin: Double {
        return sqrt(Double(x)*Double(x) + Double(y)*Double(y))
    }
}

Location()
Location(x: 2, y: 2)
