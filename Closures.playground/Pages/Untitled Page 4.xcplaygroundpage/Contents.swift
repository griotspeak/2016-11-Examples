func repeater(times: Int) -> (String) -> String {
    return { (phrase: String) -> String in
        var newString = ""

        for _ in 0..<times {
            newString.append(phrase)
        }

        return newString
    }
}

let asker: (String) -> String = repeater(times: 3)

print(asker("Are we there yet? \n"))


["Hey ", "Are we there yet?\n"].map(repeater(times: 2))