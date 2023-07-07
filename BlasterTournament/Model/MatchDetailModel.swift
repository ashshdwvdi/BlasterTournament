//
//  MatchDetailModel.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

struct PlayerInfo: Codable {
    let id: Int
    let icon: String
    let name: String
}

typealias PlayersInfo = [PlayerInfo]
