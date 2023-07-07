//
//  PlayerList.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

typealias PlayerList = [PlayerMatchDetail]

struct PlayerMatchDetail: Codable {
    let match: Int
    let player1, player2: PlayerModel
}

struct PlayerModel: Codable {
    let id, score: Int
}
