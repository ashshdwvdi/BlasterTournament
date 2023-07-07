//
//  ContentView.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

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
                        NavigationLink {
                            Text("here is details view for : \(player.name)")
                        } label: {
                            PlayerView(player: player)
                        }
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
