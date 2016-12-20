struct Person {
    let name: String
    let occupation: String
    let powerLevel: Int?
    let students: [String]
}

let dictionary: [String : Any] = [
    "name" : "TJ",
    "occupation" : "Mic Magician",
    "power-level" : 9001,
    "students" : ["Adrian", "Amy", "Jon"]
]

var person: Person?
if let name = dictionary["name"] as? String,
    let students = dictionary["students"] as? [String],
    let occupation = dictionary["occupation"] as? String {

    let powerLevel = dictionary["power-level"] as? Int
    person = Person(name: name, occupation: occupation, powerLevel: powerLevel, students: students)
} else {
    person = nil
}

print(person)
