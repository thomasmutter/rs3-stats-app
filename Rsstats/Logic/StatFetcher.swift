//
//  StatFetcher.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import Foundation
import Combine

class StatFetcher {
    
    let decoder = JSONDecoder()
    let url = URL(string: "https://rs3-stats.herokuapp.com/rs-stats-api/v1/stats/")!
    var stats = Set<AnyCancellable>()

    func fetchStats() -> AnyPublisher<[StatModel], Never> {
        let request = URLRequest(url: url)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [StatModel].self, decoder: decoder)
            .replaceError(with: [StatModel()])
            .eraseToAnyPublisher()
    }
}
