//
//  Player.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

typealias Players = [Player]
struct Player: Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var score: Int
}

extension Player {
    static var dummy: [Player] {
        [
            Player(id: 0, imageName: "a-image", name: "Darth Vader", score: 22),
            Player(id: 1, imageName: "a-image", name: "Darth Vader1", score: 222),
            Player(id: 3, imageName: "a-image", name: "Darth Vader2", score: 2),
            Player(id: 3, imageName: "a-image", name: "Darth Vader3", score: 0)
        ]
    }
}
