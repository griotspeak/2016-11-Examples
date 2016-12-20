struct SafeCombo : Equatable, CustomStringConvertible {
    let numbers: [Int]

    public static func == (lhs: SafeCombo, rhs: SafeCombo) -> Bool {

        lhs
        rhs

        return lhs.numbers == rhs.numbers
    }

    var description: String {
        return String(describing: numbers)
    }
}

let myCombo = SafeCombo(numbers: [1, 2, 3])
let yourCombo = SafeCombo(numbers: [4, 5, 6])

myCombo == yourCombo