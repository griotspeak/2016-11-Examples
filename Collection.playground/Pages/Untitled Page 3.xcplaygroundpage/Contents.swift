// collatz
// accepts an [Int]. returns an [Int] where, for 
// each number,
// if the number provided is even, divide by two and return
// if the number provided is odd, multply by three and add 1
// example1  input: [100,  3, 55, 32,  5]
// example1 ouptut: [ 50, 10,166, 16, 16]

func collatz(list: [Int]) -> [Int] {
    var output: [Int] = []
    for item in list {
        if item % 2 == 0 {
            output.append(item / 2)
        } else if item % 2 == 1 {
           output.append((item * 3) + 1)
        }
    }

    return output
}

collatz(list: [30, 15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1])