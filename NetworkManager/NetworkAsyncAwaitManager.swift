//
//  NetworkAsyncAwaitManager.swift
//  NetworkManager
//
//  Created by Champion Chen on 2022/12/10.
//

import Foundation

actor NetworkAsyncAwaitManager {
    static func request<T: Codable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T  {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else {
            throw RequestError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest, delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw RequestError.decode
                }
                print("🐕 Response: \(decodedResponse)")
                return decodedResponse
            case 401:
                throw RequestError.unauthorised
            default:
                throw RequestError.unknown
            }
            
        } catch URLError.Code.notConnectedToInternet {
            throw RequestError.offline
        }
    }
}
