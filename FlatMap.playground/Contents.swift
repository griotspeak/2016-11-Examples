let input: [[[Int]]] = [
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
    [[4, 5, 6], [7, 8, 9], [1, 2, 3]],
    [[1, 2, 3], [7, 8, 9], [4, 5, 6]],
]

let firstExample = input.flatMap {
    $0
}
print(firstExample)

let secondExample = input.map { outer in
    outer.flatMap { $0 }
}

print(secondExample)


let letters: [Character] = ["a", "b", "c", "d", "e"]
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]


let foo = letters.flatMap { letter in
    numbers.map { number in
        (letter, number)
    }
}

var bar: [(Character, Int)] = []

for letter in letters {
    for number in numbers {
        bar.append((letter, number))
    }
}

zip(foo, bar).reduce(foo.count == bar.count) { (accum, element) in
    return accum && element.0 == element.1
}
