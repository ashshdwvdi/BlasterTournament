//
//  PlayerMatchViewModel.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

class PlayerMatchViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    private var matchesScores: MatchesScores = []
    private var sortResultsDsc: Bool = false
    private let session: URLSession
    
    private enum ApiError: Error {
        case badURL
    }
    
    init(urlSession: URLSession = .shared) {
        self.session = urlSession
    }
    
    func fetchContestInfo() async throws {
        let playerList: PlayersInfo = try await fetch(urlString: Constants.playerInfoUrl)
        let matches: MatchDetails = try await fetch(urlString: Constants.matchInfoUrl)
        let playerScores = calculateScores(from: matches)
        var playersMap: [Int: String] = [:]
        
        playerList.forEach { contestant in
            playersMap[contestant.id] = contestant.name
        }
        
        self.matchesScores =  matches.map { playerDetail in
            PlayerMatchScore(
                opponent: playersMap[playerDetail.player1.id] ?? "",
                player: playersMap[playerDetail.player2.id] ?? "",
                opponentScore: playerDetail.player1.score,
                score: playerDetail.player2.score
            )
        }
        
        await MainActor.run {
            players = playerList.map { contestant in
                Player(
                    id: contestant.id,
                    imageName: contestant.icon,
                    name: contestant.name,
                    score: playerScores[contestant.id] ?? 0
                )
            }
            .sorted { $0.score > $1.score }
        }
    }
    
    // TODO: - fix this use player id instead of name here.
    func getMatchDetails(for playerName: String) -> MatchesScores {
        return self.matchesScores.filter { match in
            match.player == playerName || match.opponent == playerName
        }
    }
    
    func toggleSort() async {
        sortResultsDsc.toggle()
        
        await MainActor.run {
            self.players.sort { p1, p2 in
                if sortResultsDsc {
                    return p1.score < p2.score
                } else {
                    return p1.score > p2.score
                }
            }
        }
    }
    
    // MARK: - Api Helper
    
    private func fetch<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw ApiError.badURL
        }
        
        let response = try await session.data(from: url)
        return try JSONDecoder().decode(T.self, from: response.0)
    }
    
    private func calculateScores(from matches: MatchDetails) -> [Int: Int] {
        // PlayeID: score
        var playerScores: [Int: Int] = [:]
        
        for match in matches {
            let p1 = match.player1.score
            let p2 = match.player2.score
            
            var p1Score = 0
            var p2Score = 0
            
            if p1 > p2 {
                p1Score += 3
            } else if p2 > p1 {
                p2Score += 3
            } else if p1 == p2 {
                p1Score += 1
                p2Score += 1
            }
            
            // contestant1 1 score update
            if let contestant1 = playerScores[match.player1.id] {
                playerScores[match.player1.id] = contestant1 + p1Score
            } else {
                playerScores[match.player1.id] = p1Score
            }
            
            // contestant1 2 score update
            if let contestant2 = playerScores[match.player2.id] {
                playerScores[match.player2.id] = contestant2 + p2Score
            } else {
                playerScores[match.player2.id] = p2Score
            }
        }
        return playerScores
    }
}
