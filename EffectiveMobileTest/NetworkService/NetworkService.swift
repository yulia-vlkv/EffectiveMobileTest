//
//  NetworkService.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 02.06.2024.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}

    func fetchTickets(completion: @escaping (Result<TicketsResponse, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        fetchData(from: url, completion: completion)
    }

    func fetchTicketOffers(completion: @escaping (Result<TicketOffersResponse, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        fetchData(from: url, completion: completion)
    }

    func fetchMusicCards(completion: @escaping (Result<MusicCardsResponse, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        fetchData(from: url, completion: completion)
    }

    private func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


enum NetworkError: Error {
    case invalidURL
    case noData
}
