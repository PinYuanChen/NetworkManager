//
// Created on 2022/11/14.
//

import Foundation

protocol Endpoint {
    /// HTTP or HTTPS
    var scheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    /// [URLQueryItem(name: "api_key", value: API_KEY)]
    var parameters: [URLQueryItem] { get }
    
    /// "GET" or "POST"
    var method: String { get }
}
