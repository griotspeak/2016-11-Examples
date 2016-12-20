import Foundation

// * public - visible to everything (outside of the module)
// * internal - visible only in the module
// * fileprivate - visible only in the file
// private - visible only in the scope of declaration


let oracle = Oracle()

let hint = Brutus().betray(friend: oracle)
let output: String = oracle.evaluate(guess: hint)


