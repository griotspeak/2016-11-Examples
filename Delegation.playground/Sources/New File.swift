import Foundation

class Foo {
    func name() -> String {
        return "bob"
    }
    var closure: ((Void) -> Void)?
    init(closure: ((Void) -> Void)? = nil) {
        self.closure = closure
    }

    func populateClosureWithPrint() {
        closure = { [weak self] (_) -> () in
            print(self?.name())
        }
    }
}


let instance = Foo()
