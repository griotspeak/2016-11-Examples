enum Status {
    case early(Int)
    case onTime
    case late(Int)
    case cancelled(String)
}

let flightStatus: Status = Status.cancelled("Birds.")
let trainStatus: Status = .early(10)
let busStatus = Status.early(10)

switch trainStatus {
case .early(let amount):
    print("we're gonna be \(amount) minutes early!")
case .onTime:
    print("Right on time!")
case .late(let amount):
    print("Grumble Grumble. We're always \(amount) minutes late!")
case .cancelled(let reason):
    print("Sorry love, I won't make it home because \(reason)")
}


enum Operation {
    case addition(Int, Int)
        case negation(Int)
}

let op = Operation.addition(1, 2)
switch op {
case let .addition(lhs, rhs):
    print(lhs + rhs)
case let .negation(n):
    print(-n)
}





