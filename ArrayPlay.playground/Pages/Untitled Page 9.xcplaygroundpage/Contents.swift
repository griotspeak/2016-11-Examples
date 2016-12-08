

func myReadline() -> String?  {
    return "3"
}

extension String {
    var intValue: Int? {
        return Int(self)
    }
}



let ridiculous = myReadline()?.intValue?.description

