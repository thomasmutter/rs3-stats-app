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

    func fetchStats(username: String = "") -> AnyPublisher<[StatModel], RequestError> {
        let formattedName = username.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: formattedName, relativeTo: baseUrl)!
        let request = URLRequest(url: url)
        print(url.absoluteString)
        
        // Before mapping to data, check if reponse is 200, if not throw an error and see how this can be caught
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{ element in
                guard let response = element.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [StatModel].self, decoder: decoder)
            .mapError{ error -> RequestError in
                switch (error as? URLError)?.errorCode {
                case 404:
                    return .userNotFound(error: error)
                default:
                    return .failedRequest(error: error)
                }
            }
            .eraseToAnyPublisher()
    }
}

enum RequestError: Error {
    case failedRequest(error: Error)
    case userNotFound(error: Error)
}

