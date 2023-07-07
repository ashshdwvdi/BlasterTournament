//
//  PlayerList.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

typealias MatchDetails = [PlayerMatchDetail]

struct PlayerMatchDetail: Codable {
    var match: Int
    var player1: PlayerModel
    var player2: PlayerModel
}

struct PlayerModel: Codable {
    var id, score: Int
}
