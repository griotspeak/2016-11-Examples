import Foundation
import UIKit

let foo: UITableView

protocol ArrayExaminerDelegate : NSObjectProtocol {
    func arrayExaminer(_ examiner: ArrayExaminer, encountered element: Character)
}

class ArrayExaminer {
    let list: [Character]
    weak var delegate: ArrayExaminerDelegate?

    init(list: [Character]) {
        self.list = list
    }

    func examine() {
        for i in list {
            delegate?.arrayExaminer(self, encountered: i)
        }
    }
}

