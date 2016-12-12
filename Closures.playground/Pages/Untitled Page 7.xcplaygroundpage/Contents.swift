func joinDigits_usingJoinWithSeparator(list: [Int]) -> String {
    return list.map({ String(describing: $0)})
        .joined(separator: " ")
}


joinDigits_usingJoinWithSeparator(list: [1, 2, 3])
