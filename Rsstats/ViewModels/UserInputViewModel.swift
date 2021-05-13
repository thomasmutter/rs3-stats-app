//
//  ViewModel.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import Foundation
import Combine

class UserInputViewModel: ObservableObject {
    @Published var stats: [StatModel] = []
    @Published var statsLoaded: Bool = false
    @Published var errorMessage = ""
    
    private var cancellable: AnyCancellable?
    private let api = RsStatsApi()
    
    func loadStats(username: String = "") {
        errorMessage = ""
        let publisher = api.fetchStats(username: username)
        
        // Instead of assign, use sink to fill both stats and a
        cancellable = publisher
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        self.statsLoaded = true
                    case .failure(let completion):
                        self.handleError(error: completion)
                    }
                },
                receiveValue: {
                    self.stats = $0
                }
            )
    }
    
    func handleError(error: RequestError) {
        switch error {
        case .failedRequest:
            errorMessage = "An error has occurred"
        case .userNotFound:
            errorMessage = "User not found"
        }
        print("Error has occurred: \(error)")
    }
    
    func clearStats() {
        stats.removeAll()
    }
}
