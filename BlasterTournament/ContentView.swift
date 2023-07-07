//
//  ContentView.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

typealias Players = [Player]
struct Player: Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var score: Int
}

struct ContentView: View {
    var players: [Player] = Player.dummy
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.05)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Divider()
                    Text(Constants.headerTitle)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .fontWeight(.semibold)
                    List(players) { player in
                        PlayerView(player: player)
                    }
                    .listStyle(.plain)
                    .navigationTitle(Constants.title)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
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
