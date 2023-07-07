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
    private static let title: String = "Star Wars Blaster Tournament"
    private static let headerTitle: String = "Points Table"
    
    var players: [Player] = Player.dummy
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.05)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Divider()
                    Text(Self.headerTitle)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .fontWeight(.semibold)
                    List(players) { player in
                        PlayerView(player)
                    }
                    .listStyle(.plain)
                    .navigationTitle(Self.title)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
    
    @ViewBuilder
    private func PlayerView(_ player: Player) -> some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: player.imageName)) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
            } placeholder: {
                Color.gray.opacity(0.2)
                    .frame(width: 50, height: 50)
            }
            Text(player.name)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Spacer()
            Text(player.score, format: .number)
                .fontWeight(.semibold)
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
