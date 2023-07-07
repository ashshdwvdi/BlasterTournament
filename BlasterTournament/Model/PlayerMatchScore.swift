//
//  PlayerMatchScore.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

typealias MatchesScores = [PlayerMatchScore]

struct PlayerMatchScore: Identifiable {
    var id = UUID()
    var opponent: String
    var player: String
    var opponentScore: Int
    var score: Int
}

extension PlayerMatchScore {
    static var dummy: [PlayerMatchScore] = {
        [
            PlayerMatchScore(opponent: "Chewbaca", player: "Pricess", opponentScore: 80, score: 93),
            PlayerMatchScore(opponent: "Chewbaca1", player: "Pricess1", opponentScore: 98, score: 98),
            PlayerMatchScore(opponent: "Chewbaca2", player: "Pricess2", opponentScore: 83, score: 82),
        ]
    }()
}
