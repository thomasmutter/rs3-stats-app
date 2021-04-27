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
    
    private var bag = Set<AnyCancellable>()
    private let fetcher = RsStatsApi()
    
    func loadStats(username: String = "") {
        print("starting")
        let publisher = fetcher.fetchStats(username: username)
        
        // Instead of assign, use sink to fill both stats and a
        publisher
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: {
                    self.statsLoaded = true
                    self.stats = $0
                }
            )
//            .assign(to: \.stats, on: self)
            .store(in: &bag)
    }
    
    func clearStats() {
        stats.removeAll()
    }
}
