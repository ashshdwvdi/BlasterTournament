//
//  MatchScores.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

struct MatchScores: View {
    let matches: MatchesScores
    
    var body: some View {
        List(matches) { score in
            HStack {
                Text(score.opponent)
                Spacer()
                Text("\(score.opponentScore) - \(score.score)")
                Spacer()
                Text(score.player)
            }
            .padding(20)
            .background(matchResult(player: score.score, against: score.opponentScore))
        }
        .listStyle(.plain)
    }
    
    private func matchResult(player: Int, against opponent: Int) -> Color {
        if player > opponent {
            return Color.green
        } else if player < opponent {
            return Color.red
        } else {
            return Color.white
        }
    }
}
