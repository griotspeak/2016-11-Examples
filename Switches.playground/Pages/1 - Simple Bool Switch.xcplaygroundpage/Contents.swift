func greet(happily: Bool) -> String {
    switch happily {
    case true:
        return "Howdy!"
    case false:
        return "What do you want?"
    }
}