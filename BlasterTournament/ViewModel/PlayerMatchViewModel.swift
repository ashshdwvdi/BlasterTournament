//
//  PlayerMatchViewModel.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import Foundation

class PlayerMatchViewModel: ObservableObject {
    private var matchesScores: MatchesScores = []
    @Published var players: [Player] = []
    
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
        await MainActor.run {
            players = playerList.map(Self.createPlayer)
        }
    }
    
    // MARK: - Api Helper
    
    private static func createPlayer(_ contestant: PlayerInfo) -> Player {
        Player(id: contestant.id, imageName: contestant.icon, name: contestant.name, score: 0)
    }
    
    private func fetch<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw ApiError.badURL
        }
        
        let response = try await session.data(from: url)
        return try JSONDecoder().decode(T.self, from: response.0)
    }
}
