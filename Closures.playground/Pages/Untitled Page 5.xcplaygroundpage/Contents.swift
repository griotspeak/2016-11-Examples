// map is a Higher Order Function because it accepts a closure
func map(list: [Int], transform: (Int) -> String) -> [String] {
    var newList: [String] = []
    for item in list {
        newList.append(transform(item))
    }
    return newList
}

map(list: [1, 2, 3], transform: { input in
    return String(describing: input)
})

map(list: [2, 3, 4]) { input in
    // Trailing closure syntax allows me to pull the closure out of the parens
    return String(describing: input)
}

map(list: [3, 4, 5]) { input in
    // I can omit return because I only have one expression in the closure
    String(describing: input)
}

map(list: [3, 4, 5]) {
    // $0 represents 'the first parameter'
    // $1 represents the second and so on
    String(describing: $0)
}

func makeString(int: Int) -> String {
    return String(describing: int)
}

// We can pass in the init method as a closure
map(list: [3, 4, 5], transform: String.init)

