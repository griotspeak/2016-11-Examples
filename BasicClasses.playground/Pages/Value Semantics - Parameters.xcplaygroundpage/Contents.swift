// Value semantics
struct Cylon {
    var name: String = "Unknown"
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


func incrementAge(being: Cylon) {
    var newBeing = being
    newBeing.age += 1
}

var timmy = Cylon(name: "Timmy", age: 3)

print(timmy.age)
incrementAge(being: timmy)
print(timmy.age)