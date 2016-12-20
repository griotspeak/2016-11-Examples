import Foundation

let dictionary: [String : Any] = [
    "name" : "TJ",
    "occupation" : "Mic Magician",
    "power-level" : 9001,
    "students" : ["Adrian", "Amy", "Jon"]
]

let jsonRepresentation = try! JSONSerialization.data(withJSONObject: dictionary, options: [])

print(String(bytes: jsonRepresentation, encoding: .utf8))
