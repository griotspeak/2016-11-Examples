func addThreeToElements_old(list: [Int]) -> [Int] {
    var newList: [Int] = []
    for item in list {
        newList.append(item + 3)
    }
    return newList
}

func addThree(to input: Int) -> Int {
    return input + 3
}

func addThreeToElements_middle(list: [Int]) -> [Int] {
    var newList: [Int] = []
    for item in list {
        newList.append(addThree(to: item))
    }
    return newList
}


// map is a Higher Order Function because it accepts a closure
func map(list: [Int], transform: (Int) -> Int) -> [Int] {
    var newList: [Int] = []
    for item in list {
        newList.append(transform(item))
    }
    return newList
}

func addThreeToElements_new(list: [Int]) -> [Int] {
    return map(list: list, transform: addThree)
}


addThreeToElements_old(list: [1, 2, 3]) == addThreeToElements_middle(list: [1, 2, 3])
addThreeToElements_old(list: [1, 2, 3]) == addThreeToElements_new(list: [1, 2, 3])
addThreeToElements_old(list: [1, 2, 3]) == map(list: [1, 2, 3], transform: addThree)