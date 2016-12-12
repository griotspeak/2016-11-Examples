enum BinaryOp {
    case add
    case subtract

    func compute(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        }
    }
}



func compute(_ lhs: Int, _ rhs: Int, operation: BinaryOp) -> Int {
    return operation.compute(lhs, rhs)
}


BinaryOp.add.compute(2, 3)

compute(1, 2, operation: .add)
compute(1, 2, operation: .subtract)
