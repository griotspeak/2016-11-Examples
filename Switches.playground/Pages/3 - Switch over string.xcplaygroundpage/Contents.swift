let text = "Red Cat"

// Default cases catch unspecified values
switch text {
case "Blueberry":
    print("You're turning violet, Violet!")
case "Red Herring":
    print("I'm not so easily distracted")
default:
    print("No one expects a Spanish Inquisition!")
}

switch text {
case "Blueberry":
    print("You're turning violet, Violet!")
case "Red Herring":
    print("I'm not so easily distracted")
case let x where x.hasPrefix("Red"):
    print("I like the color red!")
    print("I would like to have a \(x)")
default:
    print("No one expects a Spanish Inquisition!")
}