func printAllItems<I : IteratorProtocol>(iterator: I)
    where I.Element == Int {

        var iter = iterator
        
        while let element = iter.next()  {
            print(element)
        }
}

let arrayIterator = [1, 2, 3, 4, 5, 6, 7].makeIterator()
printAllItems(iterator: arrayIterator)