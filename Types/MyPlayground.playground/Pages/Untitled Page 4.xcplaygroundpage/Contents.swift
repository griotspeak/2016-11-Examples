func sleepIn1(weekday isWeekday: Bool, vacation isVacation: Bool) -> Bool {
    if isVacation {
        return true
    } else if isWeekday {
        return false
    } else {
        return true
    }
}
sleepIn1(weekday: false, vacation: false) == true
sleepIn1(weekday: true, vacation: false)  == false
sleepIn1(weekday: false, vacation: true)  == true
sleepIn1(weekday: true, vacation: true)   == true

func sleepIn2(weekday isWeekday: Bool, vacation isVacation: Bool) -> Bool {
    return (isWeekday == false) || (isVacation)
}
sleepIn2(weekday: false, vacation: false) == true
sleepIn2(weekday: true, vacation: false)  == false
sleepIn2(weekday: false, vacation: true)  == true
sleepIn2(weekday: true, vacation: true)   == true

func sleepIn3(weekday isWeekday: Bool, vacation isVacation: Bool) -> Bool {
    if isWeekday == true && isVacation == false {
        return false
    } else if isWeekday == true && isVacation == true {
        return true
    } else if isWeekday == false && isVacation == false {
        return true
    } else /*if !isWeekday && isVacation */{
        return true
    }
}

sleepIn3(weekday: false, vacation: false) == true
sleepIn3(weekday: true, vacation: false)  == false
sleepIn3(weekday: false, vacation: true)  == true
sleepIn3(weekday: true, vacation: true)   == true
