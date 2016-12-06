var orderedList = [5]
orderedList.append(3)
orderedList.append(contentsOf: [9])
orderedList.insert(7, at: 0)
orderedList.insert(contentsOf: [8, 6], at: 0)
orderedList.insert(0, at: 5)

for i in orderedList {
    print(i)
}

print("---")

let expectedNumber = [8, 6, 7, 5, 3, 0, 9]
