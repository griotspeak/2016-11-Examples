import Foundation

var list: [(String, Int)] = []

for _ in 0..<200 {
    let magnitude = Int(arc4random_uniform(100))
    switch arc4random_uniform(6) {
    case 0:
        list.append(("NORTH", magnitude))
    case 1:
        list.append(("EAST", magnitude))
    case 2:
        list.append(("SOUTH", magnitude))
    case 3:
        list.append(("WEST", magnitude))
    case 4:
        list.append(("left", magnitude))
    case 5:
        list.append(("right", magnitude))
    default:
        fatalError()
    }
}
print(list.map { "\($0) \($1)" }.joined(separator: ",\n"))