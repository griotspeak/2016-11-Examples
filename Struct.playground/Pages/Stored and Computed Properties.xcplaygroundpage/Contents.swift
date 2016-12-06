import Foundation

//: Properties
struct Location {

    // x and y are stored properties.
    // Stored properties can only be declared in the types declaraion (they cannot be added in an extension)
    let x: Int
    let y: Int

    // distanceFromOrigin is a computed property
    var distanceFromOrigin: Double {
        return sqrt(Double(x)*Double(x) + Double(y)*Double(y))
    }
}

let position = Location(x: 3, y: 4)
position.distanceFromOrigin