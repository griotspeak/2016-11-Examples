import Foundation

struct Location {
    let x: Int
    let y: Int

    // You can provide default values to parameters just like in function
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }

    var distanceFromOrigin: Double {
        return sqrt(Double(x)*Double(x) + Double(y)*Double(y))
    }
}

let position1 = Location()
(position1.x, position1.y)
let position2 = Location(x: 2, y: 3)
(position2.x, position2.y)
let position3 = Location(y: 3)
(position3.x, position3.y)


