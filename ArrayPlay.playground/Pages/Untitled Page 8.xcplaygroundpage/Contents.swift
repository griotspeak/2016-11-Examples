// implicitly unwrapped optionals

let number: Int! = Int("foo")

func onlyAcceptsNonoptionals(input: Int) -> Int {
    return input + input
}

// crashes
//onlyAcceptsNonoptionals(input: number)
