enum ScoringAction {
    case touchdown
    case extraPoint
    case twoPointConversion
    case safety
    case fieldGoal

    var pointValue: Int {
        switch self {
        case .touchdown:
            return 6
        case .extraPoint:
            return 1
        case .twoPointConversion, .safety:
            return 2
        case .fieldGoal:
            return 3
        }
    }
}

struct Team {
    let name: String
    var actions: [ScoringAction]
    var points: Int {
        var output = 0
        for action in actions {
            output += action.pointValue
        }

        return output
    }

}

struct Game {
    var home: Team
    var away: Team

    var status: String {
        return "\(home.name): \(home.points)\n\(away.name): \(away.points)"
    }
}

let sharks = Team(name: "Sharks", actions: [.touchdown])
let jets = Team(name: "Jets", actions: [])

var sharksVsJets = Game(home: sharks, away: jets)

sharksVsJets.status
