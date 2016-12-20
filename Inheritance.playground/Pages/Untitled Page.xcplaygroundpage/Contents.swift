class Individual {
    let name: String

    init(name: String) {
        self.name = name
    }
}

typealias NPCBehavior = Void

class NonPlayerCharacter : Individual {
    var behavior: NPCBehavior
    init(name: String, behavior: NPCBehavior) {
        self.behavior = behavior
        super.init(name: name)
    }
}

class Avatar : Individual {

}
