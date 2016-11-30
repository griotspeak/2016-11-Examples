enum Feeling {
    case hot
    case cold
}

func isIt(feeling: Feeling, temp: Int) -> Bool {
    // Whatever comes immediately after the word 'switch' is our input. Whenever we write 'case value', we are saying 'whenever the input equals value'.
    switch feeling {
    case .hot:
        return temp > 100
    case .cold:
        return temp < 0
    }
}


isIt(feeling: Feeling.hot, temp: 20)
isIt(feeling: .cold, temp: -2)
