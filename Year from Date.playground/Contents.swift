import Foundation

let now = Date()
let calendar = Calendar(identifier: .gregorian)
var components = calendar.dateComponents([.year], from: now)
print(components.year!)