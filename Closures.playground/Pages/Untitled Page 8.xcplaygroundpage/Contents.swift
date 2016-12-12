func sum(of list: [Int]) -> Int {
    var output = 0

    for item in list {
        output = output + item
    }

    return output
}

func product(of list: [Int]) -> Int {
    var output = 1

    for item in list {
        output = output * item
    }

    return output
}

func myReduce(of list: [Int], seed: Int, transform: (Int, Int) -> Int) -> Int {
    var output = seed

    for item in list {
        output = transform(output, item)
    }

    return output
}

func myReduce(of list: [Int], seed: String, transform: (String, Int) -> String) -> String {
    var output = seed

    for item in list {
        output = transform(output, item)
    }

    return output
}

let addition: (Int, Int) -> Int = { (lhs: Int, rhs: Int) -> Int in
    return lhs + rhs
}

let multiplication: (Int, Int) -> Int = { (lhs: Int, rhs: Int) -> Int in
    return lhs * rhs
}

let appendDigits: (String, Int) -> String = { (lhs, rhs) in
    return lhs + String(describing: rhs)
}

myReduce(of: [1, 2, 3, 4], seed: 0, transform: addition)
myReduce(of: [1, 2, 3, 4], seed: 1, transform: multiplication)
myReduce(of: [1, 2, 3, 4], seed: "", transform: appendDigits)

sum(of: [1, 2, 3, 4])