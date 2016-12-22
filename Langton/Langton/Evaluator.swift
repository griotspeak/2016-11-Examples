//
//  Evaluator.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

struct Evaluator {
    typealias State = (ant: Ant, grid: Grid)

    static func convert(spot: Spot) -> RelativeDirection {
        switch spot {
        case .black:
            return .left
        case .white:
            return .right
        }
    }

    static func step(state: State) -> State {
        let (ant, grid) = state
        let newDirection = convert(spot: grid[ant.location])
        let newOrientation = ant.orientation.turn(newDirection)
        let newGrid = grid.flippingSpot(at: ant.location)
        let newLocation = Location(1, newOrientation, from: ant.location)
        return (Ant(at: newLocation, facing: newOrientation), newGrid)
    }
}
