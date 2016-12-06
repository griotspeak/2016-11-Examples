var collection: Array<Int> = [0, 1, 2]


collection[1] = 10

struct TwoByTwoBoard {

    enum Marker {
        case x, o
    }

    var state: State

    typealias State = (ul: Marker, ur: Marker, ll: Marker, lr: Marker)


//    subscript(row: Int) -> [Marker] {
//
//        switch row {
//        case 0:
//            return [state.ul, state.ur]
//        case 1:
//            return [state.ll, state.lr]
//        default:
//            fatalError("Invalid row number requested")
//        }
//    }
}

let board = TwoByTwoBoard(state: (.x, .o, .o, .x))
//board[0]
//board[1]
//board[111]
board.state.ll
