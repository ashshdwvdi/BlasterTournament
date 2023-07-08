//
//  ContentView.swift
//  BlasterTournament
//
//  Created by Ashish Dwivedi on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PlayerMatchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.05)
                    .edgesIgnoringSafeArea(.all)
                if viewModel.players.isEmpty {
                    ProgressView()
                } else {
                    VStack(alignment: .leading) {
                        Divider()
                        Text(Constants.headerTitle)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .fontWeight(.semibold)
                        List(viewModel.players) { player in
                            NavigationLink {
                                MatchScores(matches: viewModel.getMatchDetails(for: player.name))
                            } label: {
                                PlayerView(player: player)
                            }
                        }
                        .listStyle(.plain)
                        .navigationTitle(Constants.title)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(Constants.sortString) {
                                    Task {
                                        await viewModel.toggleSort()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            do {
                try await viewModel.fetchContestInfo()
            } catch {
                print("Error \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
