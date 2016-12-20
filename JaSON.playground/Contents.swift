import Foundation

let dictionary: [String : Any] = [
    "name" : "TJ",
    "occupation" : "Mic Magician",
    "power-level" : 9001,
    "students" : ["Adrian", "Amy", "Jon"]
]

if let name = dictionary["name"] as? String {
    print(name)
} else {
    print("name was not a string")
}