

func greet(name: String = "friend") {
    print("Hello, \(name)!")
}

func greeting(name: String) -> String {
    return "Hello, \(name)!"
}

greet()
greet(name: "Jane")
let greetIkenna = greeting(name: "Ikenna")
print(greetIkenna)
