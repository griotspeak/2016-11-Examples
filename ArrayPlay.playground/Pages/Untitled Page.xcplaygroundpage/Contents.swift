func firstLast(input: [Int]) -> Bool {
    guard !input.isEmpty else {
        fatalError()
    }

    return input[input.startIndex] == 6 || input[input.index(before: input.endIndex)] == 6
}

func firstLast(input: [Int]) -> Bool {
    return input.first
}