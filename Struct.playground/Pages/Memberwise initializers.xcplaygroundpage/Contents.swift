import Foundation

struct Location {
    let x: Int
    let y: Int

    // This is what we get for free
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }

    var distanceFromOrigin: Double {
        return sqrt(Double(x)*Double(x) + Double(y)*Double(y))
    }
}


// Location(x:y:) is a memberwise initializer that we received 'for free'
Location(x: 3, y: 4)

