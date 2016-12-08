var people: [String: String] = [
    "Kwame" : "Earth",
    "Gi" : "Water",
    "Linka" : "Wind",
    "Wheeler" : "Fire",
]

people["Ma-Ti"] = "Fainting"

if let oldElement = people.updateValue("Heart", forKey: "Ma-Ti") {
    print(oldElement)
}

people["Kimberly"]

var ages: [String: Int] = [
    "Little Bear" : 3,
    "Papa Bear" : 39,
    "Mama Bear" : 24,
    "Goldie" : 18
]

let goldieAge: Int? = ages["Goldie"]

if goldieAge != nil {
    let gAge = goldieAge!
    print("Goldie's age is \(gAge)")
}


if let gAge = goldieAge {
    print("Goldie's age is \(gAge)")
} else {
    print("Who?")
}

