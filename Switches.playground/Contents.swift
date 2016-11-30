func sleepInOld(weekday: Bool, vacation: Bool) -> Bool {
    if weekday && vacation {
        return true
    } else if !weekday && vacation {
        return true
    } else if !weekday && !vacation {
        return true
    } else /*if weekday && !vacation*/ {
        return false
    }
}