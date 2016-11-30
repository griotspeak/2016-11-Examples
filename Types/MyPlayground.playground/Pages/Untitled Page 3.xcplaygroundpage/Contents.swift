let answer = 23

func evaluate(guess: Int) -> Bool {

    if guess < answer {
        print("Too low!")
    } else if guess > answer {
        print("Too high!")
    } else {
        print("Spot on!")
    }

    return guess == answer
}

evaluate(guess: 2)
evaluate(guess: 100)
evaluate(guess: 23)
