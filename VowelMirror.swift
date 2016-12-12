//
//  VowelMirror.swift
//  
//
//  Created by TJ Usiyan on 2016/12/12.
//
//

func vowelMirror(input: String) -> String {
    let chars = input.characters
    let indices = chars.indices
    var vowelSpots: [String.CharacterView.Index] = []
    let vowels: Set<Character> = [
        "a", "e", "i", "o", "u",
        "A", "E", "I", "O", "U"

    ]
    for index in indices {
        if vowels.contains(chars[index] ) {
            vowelSpots.append(index)
        }
    }
    let mirroredIndices = Array(zip(vowelSpots, vowelSpots.reversed()))
    var newIndices: [String.CharacterView.Index] = []
    for index in indices {

        var indexToAppend: String.CharacterView.Index? = nil

        for (increasingIndex, decreasingIndex) in mirroredIndices {
            if index == increasingIndex {
                indexToAppend = decreasingIndex
            }
        }

        newIndices.append(indexToAppend ?? index)
    }

    var newChars: [Character] = []
    for index in newIndices {
        newChars.append(chars[index])
    }
    return String(newChars)
}


vowelMirror(input: "Hello") == "Holle"
vowelMirror(input: "Christmas") == "Chrastmis"
vowelMirror(input: "Racecar") == "Racecar"
vowelMirror(input: "Apples") == "epplAs"



