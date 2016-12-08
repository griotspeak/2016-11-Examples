
struct Board : CustomStringConvertible {
    // There should only ever be 9 items in this array
    var spaces: [Space?]

    var description: String {
        let horizontalLine = "-----"

        func desc(_ index: Int) -> String {
            return spaces[index]?.description ?? " "
        }

        //              (0, 0)       (0, 1)       (0, 2)
        let lineOne = "\(desc(0))|\(desc(1))|\(desc(2))"

        //              (1, 0)       (1, 1)       (1, 2)
        let lineTwo = "\(desc(3))|\(desc(4))|\(desc(5))"

        //              (2, 0)       (2, 1)       (2, 2)
        let lnThree = "\(desc(6))|\(desc(7))|\(desc(8))"


        return "\(lineOne)\n\(horizontalLine)\n\(lineTwo)\n\(horizontalLine)\n\(lnThree)"
    }

    subscript(row: Int, col: Int) -> Space? {
        get {
            return spaces[index(row: row, col: col)]
        }

        set {
            spaces[index(row: row, col: col)] = newValue
        }
    }

    func index(row: Int, col: Int) -> Int {
        return (row * 3) + col
    }

    func coordinates(index: Int) -> (row: Int, column: Int) {
        let column = index % 3
        let row = (index - column) / 3
        return (row, column)
    }

    func isAvailable(row: Int, col: Int) -> Bool {
        return spaces[index(row: row, col: col)] == nil
    }



    mutating func place(marker: Marker, row: Int, column: Int) -> Bool {
        if isAvailable(row: row, col: column) {
            spaces[index(row: row, col: column)] = marker.spaceValue
            return true
        } else {
            return false
        }
    }
}



extension Board {
    enum Space : CustomStringConvertible {
        case x
        case o

        var description: String {
            switch self {
            case .x:
                return "x"
            case .o:
                return "o"
            }
        }
    }

    enum Marker {
        case x
        case o
        var spaceValue: Space {
            switch self {
            case .x:
                return .x
            case .o:
                return .o
            }
        }

    }
}

var board = Board(spaces: Array(repeating: nil, count: 9))
print(board)
print()
print()
print(board)
