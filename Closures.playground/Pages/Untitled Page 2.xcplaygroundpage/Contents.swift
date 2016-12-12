enum BinaryOp {
    case add
    case subtract
    case custom((Int, Int) -> Int)

    func compute(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .custom(let op):
            return op(lhs, rhs)
        }
    }
}

let  multiply = { (_ lhs: Int, _ rhs: Int) -> Int  in
    return lhs * rhs
}

let myOp: BinaryOp = .custom(multiply)

myOp.compute(2, 3)
