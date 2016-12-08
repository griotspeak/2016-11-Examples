// Value semantics
struct Cylon {
    var name: String = "Unknown"
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let timmy = Cylon(name: "Timmy", age: 3)
//timmy.age += 1 // doesn't compile because `let` means constant
