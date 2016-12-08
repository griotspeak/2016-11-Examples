// Reference semantics
class Person {
    var name: String = "Unknown"
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


func incrementAge(being: Person) {
    let newBeing = being
    newBeing.age += 1
}

var timmy = Person(name: "Timmy", age: 3)

print(timmy.age)
incrementAge(being: timmy)
print(timmy.age)