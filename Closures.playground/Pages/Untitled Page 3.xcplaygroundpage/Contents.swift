func repeater(phrase: String) -> (Int) -> String {
    return { (times: Int) -> String in
        var newString = ""

        for _ in 0..<times {
            newString.append(phrase)
        }

        return newString
    }
}

let asker: (Int) -> String = repeater(phrase: "Are we there yet?")

print(asker(5))