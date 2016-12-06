struct Team {
    let name: String
    var touchdowns: Int
    var extraPoints: Int
    var twoPointConversions: Int
    var safeties: Int
    var fieldGoals: Int

    init(name: String) {
        self.name = name
        self.touchdowns = 0
        self.extraPoints = 0
        self.twoPointConversions = 0
        self.safeties = 0
        self.fieldGoals = 0
    }

    var points: Int {
        return ((touchdowns * 6) +
        (extraPoints) +
        (twoPointConversions * 2) +
        (safeties * 2) +
        (fieldGoals * 3))
    }
}

struct Game {
    var home: Team
    var away: Team

    var status: String {
        return "\(home.name): \(home.points)\n\(away.name): \(away.points)"
    }
}

var sharksVsJets = Game(home: Team(name: "Sharks"), away: Team(name: "Jets"))

print(sharksVsJets.status)
print("---")
sharksVsJets.away.touchdowns += 1
print(sharksVsJets.status)