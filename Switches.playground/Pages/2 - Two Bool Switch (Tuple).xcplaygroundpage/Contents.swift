
func sleepIn(weekday: Bool, vacation: Bool) -> Bool {
    switch (weekday, vacation) {
    case (true, false):
        return false
    case (false, false):
        return true
    case (false, true):
        return true
    case (true, true):
        return true
    }
}


func sleepIn2(weekday: Bool, vacation: Bool) -> Bool {
    switch (weekday, vacation) {
    case (true, false):
        return false
    case (false, false),
         (true, true),
         (false, true):
        return true
    }
}

//cold < 0
// hot > 100
// if hot == true "Is it hot?"
// if hot == false "Is it cold?"
func isIt(hot: Bool, temp: Int) -> Bool {
//    // don't forget the old ways
//    if hot {
//        return temp > 100
//    } else {
//        return temp < 0
//    }

//    // simplest translation of the old ways
//    switch (hot) {
//    case true:
//        return temp > 100
//    case false:
//        return temp < 0
//    }

    switch (hot, temp) {
    case let (true, x) where x > 100:
        return true
    case let (false, x) where x < 0:
        return true
    default:
        return false
    }

    switch (hot, temp > 100, temp < 0) {
    case (true, true, _):
        return true
    case (false, _, true):
        return true
    default:
        return false
    }
}

//isIt(hot: true, 14) == false
//isIt(hot: false, 14) -> false
//isIt(hot: true, 101) -> true
//isIt(hot: false, -20) -> true
//isIt(hot: true, -20) -> false



