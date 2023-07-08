//
//  MatchScores.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

struct MatchScores: View {
    let matches: MatchesScores
    let currentPlayer: String
    
    var body: some View {
        List(matches) { score in
            HStack {
                Text(score.opponent)
                    .frame(alignment: .leading)
                    .frame(maxWidth: 100)
                Spacer()
                Text("\(score.opponentScore) - \(score.score)")
                Spacer()
                Text(score.player)
                    .frame(alignment: .trailing)
                    .frame(maxWidth: 100)
            }
            .padding(20)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(matchResult(score))
        }
        .listStyle(.plain)
    }
    
    private func matchResult(_ match: PlayerMatchScore) -> Color {
        var player: Int
        var opponent: Int
        
        if match.player == currentPlayer {
            player = match.score
            opponent = match.opponentScore
        } else {
            player = match.opponentScore
            opponent = match.score
        }
        
        if player > opponent {
            return Color.green
        } else if player < opponent {
            return Color.red
        } else {
            return Color.white
        }
    }
}
