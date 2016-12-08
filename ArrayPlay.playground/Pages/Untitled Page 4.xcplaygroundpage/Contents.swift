// optional binding

if let number = Int("cheese") {
    print("Yay! We have the value \(number)")
} else {
    print("You need to provide a number using the digits 0-9!")
}

guard let num = Int("2") else { fatalError()/* Ususally something less drastic here */ }

