// reference semantics
class Person {
    var name: String = "Unknown"
    var age: Int = 0
}

var timmy = Person()
timmy.name = "Timmy"
timmy.age = 3


var timmyTwo = timmy
timmyTwo.name = "Timothy"

 print(timmy.name)
 print(timmyTwo.name)

func incrementAge(being: Person) {
    being.age += 1
}
print(timmy.age)
incrementAge(being: timmy)
print(timmy.age)
