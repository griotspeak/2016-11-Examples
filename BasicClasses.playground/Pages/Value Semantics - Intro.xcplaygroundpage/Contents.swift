// Value semantics
struct Cylon {
    var name: String = "Unknown"
    var age: Int = 0
}

var timmy = Cylon()
timmy.name = "Timmy"
timmy.age = 3


var timmyTwo = timmy
timmyTwo.name = "Timothy"

print(timmy.name)
print(timmyTwo.name)


