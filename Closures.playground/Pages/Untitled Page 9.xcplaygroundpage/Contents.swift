func myFilter(_ list: [Int], predicate: (Int) -> Bool) -> [Int] {

    let output: [Int] = list.reduce([]) { (accumulated, element) in

        return predicate(element) ? accumulated + [element] : accumulated
        
        if predicate(element) {
            return accumulated + [element]
        } else {
            return accumulated
        }
    }

    return output
}


print(myFilter([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { $0 % 2 == 0 })
