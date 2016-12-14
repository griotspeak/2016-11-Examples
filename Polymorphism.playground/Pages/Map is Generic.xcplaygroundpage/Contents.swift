let names = ["Amy", "Adrian", "Jon", "TJ", "John Jacob Jingleheimer Schmidt"]

names.map { name in
    return name.characters.count
}

names.map { name in
    return String(name.characters.reversed())
}

names.map {
    $0.lowercased()
}



let vowels: Set<Character> = ["a","e","i","o","u","A","E","I","O","U"]
names.map { name -> Int in
    var count = 0
    for character in name.characters {
        if vowels.contains(character) {
            count += 1
        }
    }
    return count
}

names.map { name -> Int in
    name.characters.reduce(0) { (accum, element) in
        vowels.contains(element) ? accum + 1 : accum
    }
}

import Foundation

// Does not do what I thought
let vowelCharSet = CharacterSet(charactersIn: "aeiouAEIOU")
let notVowelCharSet = vowelCharSet.inverted

vowelCharSet.contains("A")
notVowelCharSet.contains("A")

names.map { name -> Int in
    let nameChars = Set(name.characters)
    return nameChars.intersection(vowels).count
}
