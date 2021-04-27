//
//  StatFetcher.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import Foundation
import Combine

class RsStatsApi {
    
    let decoder = JSONDecoder()
    let baseUrl = URL(string: "https://rs3-stats.herokuapp.com/rs-stats-api/v1/stats/")!

    func fetchStats(username: String = "") -> AnyPublisher<[StatModel], Never> {
        let formattedName = username.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: formattedName, relativeTo: baseUrl)!
        let request = URLRequest(url: url)
        print(url.absoluteString)
        
        // Before mapping to data, check if reponse is 200, if not throw an error and see how this can be caught
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [StatModel].self, decoder: decoder)
            .replaceError(with: [StatModel()])
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
