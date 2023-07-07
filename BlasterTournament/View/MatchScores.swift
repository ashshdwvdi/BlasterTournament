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
            .padding(10)
        }
        .listStyle(.plain)
    }
}
