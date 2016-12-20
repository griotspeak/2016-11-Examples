import Foundation

public struct Oracle {

    public init() {
        self.number = Int(arc4random_uniform(10)) + 1
    }

    private let number: Int

    public func evaluate(guess: Int) -> Bool {
        return guess == number
    }

    public func evaluate(guess: Int) -> String {
        if guess < number {
            return "Too low!"
        } else if guess > number {
            return "Too high!"
        }
        return "Right on!"
    }
}
/*
extension Oracle {
    func giveHint() -> String {
        print(number)
    }
}*/

public struct Brutus {
    public init() {
    }
/*
    public func betray(friend: Oracle) -> Int {
        return friend.number
    }*/
}





func getUserInput(predicate: (String) -> Bool) -> String {
    var output: String? = nil
    while output == nil {
        if let unwrapped = readLine(), predicate(unwrapped) == true {
            output = unwrapped
        } else {
            output = nil
        }
    }

    return output!
}

func getUserInput<T>(transform: (String) -> T?) -> T {
    var output: T?
    while output == nil {
        if let unwrapped = readLine(strippingNewline: true),
            let transformed = transform(unwrapped) {
            output = transformed
        } else {
            output = nil
        }
    }

    return output!
}






