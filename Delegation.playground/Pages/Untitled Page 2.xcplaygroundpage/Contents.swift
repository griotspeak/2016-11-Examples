class Foo {
    func name() -> String {
        return "bob"
    }
    var closure: ((Void) -> Void)?
    init(closure: ((Void) -> Void)? = nil) {
        self.closure = closure
    }

    func populateClosureWithPrint() {
        closure = {
            print(instance.name)
        }
    }
}

let instance = Foo()
