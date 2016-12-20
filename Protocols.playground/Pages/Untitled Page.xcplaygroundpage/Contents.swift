struct Person : Equatable, CustomStringConvertible {
    let first: String
    let last: String

    public static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.first == rhs.first && lhs.last == rhs.last
    }

    public static func < (lhs: Person, rhs: Person) -> Bool {
        if lhs.last < rhs.last {
            return true
        } else if lhs.last > rhs.last {
            return false
        } else {
            return lhs.first < rhs.first
        }
    }

    var description: String {
        return "\(first) \(last)"
    }
}

/*
let list: [Person] = [
    Person(first: "John", last: "Appleseed"),
    Person(first: "Amy", last: "Winehome"),
    Person(first: "Wendy", last: "Smith"),
    Person(first: "John", last: "Smith"),
    Person(first: "Adrian", last: "Adams"),
]

print(list.sorted())*/
