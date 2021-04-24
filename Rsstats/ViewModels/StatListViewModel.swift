//
//  ViewModel.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import Foundation
import Combine

class StatListViewModel: ObservableObject {
    @Published var stats: [StatModel] = []
    var bag = Set<AnyCancellable>()
    
    private let fetcher = StatFetcher()
    
    func loadStats() {
        print("starting")
        let publisher = fetcher.fetchStats()
        publisher
            .receive(on: RunLoop.main)
            .assign(to: \.stats, on: self)
            .store(in: &bag)
    }
    
    func clearStats() {
        stats.removeAll()
    }
}
