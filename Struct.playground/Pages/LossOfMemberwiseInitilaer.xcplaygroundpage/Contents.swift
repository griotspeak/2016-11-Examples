import Foundation

struct Location {
    let x: Int
    let y: Int

    // Writing *an* initializer forfeits 'free' initializers for structs.
    init() {
        self.x = 0
        self.y = 0
    }

    var distanceFromOrigin: Double {
        return sqrt(Double(x)*Double(x) + Double(y)*Double(y))
    }
}

// now we can call
Location()
// but we can no longer call
Location(x: 0, y: 0)

