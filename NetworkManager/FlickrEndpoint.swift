//
// Created on 2022/11/14.
//

import Foundation

enum FlickrEndpoint: Endpoint {
    case getSearchResults(searchText: String, page: Int)
    
    var scheme: String {
        switch self {
        default: return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default: return "api.flickr.com"
        }
    }
    
    var path: String {
        switch self {
        case.getSearchResults:
            return "/services/rest/"
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = "128c87b65e36a7d4db11ee44a622df77"
        switch self {
        case.getSearchResults(let searchText,
                              let page):
            return [URLQueryItem(name: "text", value: searchText),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "method", value: "flickr.photos.search"),
                    URLQueryItem(name: "format", value: "json"),
                    URLQueryItem(name: "per_page", value: "20"),
                    URLQueryItem(name: "nojsoncallback", value: "1"),
                    URLQueryItem(name: "api_key", value: apiKey)
            ]
        }
    }
    
    var method: String {
        switch self {
        case.getSearchResults:
            return "GET"
        }
    }
}
