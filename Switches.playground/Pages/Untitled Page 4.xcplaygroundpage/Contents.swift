let myAge = 17

func oddBartender(age: Int) {
    if age > 20 {
        print("Drink up!")
    }
}

func thoroughBartender(age: Int) {
    switch age {
    case Int.min..<18:
        print("Not yet, pal")
    case 18..<21:
        print("Almost. Just wait a couple years!")
    default:
        print("Drink up!")
    }
}
