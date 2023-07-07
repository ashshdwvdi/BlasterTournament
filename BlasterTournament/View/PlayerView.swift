//
//  PlayerView.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

struct PlayerView: View {
    let player: Player
    
    var body: some View {
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
