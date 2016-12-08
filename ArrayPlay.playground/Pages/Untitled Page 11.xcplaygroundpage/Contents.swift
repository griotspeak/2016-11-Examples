func sortaUglyMultiplesOfThreeUpThrough(_ value: Int) -> [Int] {
    var list: [Int] = []

    for i in 0...value {
        if i % 3 == 0 {
            list.append(i)
        }
    }

    return list
}

func multiplesOfThreeUpThrough(_ value: Int) -> [Int] {
    var list: [Int] = []

    for i in 0...value where i % 3 == 0 {
        list.append(i)
    }

    return list
}
