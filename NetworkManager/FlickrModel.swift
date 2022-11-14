//
// Created on 2022/11/14.
//

import Foundation

struct FlickrResponse: Codable {
    let photos: FlickrResultsPage
}
struct FlickrResultsPage: Codable {
    let page: Int
    let pages: Int
    let photo: [FlickPhoto]
}
struct FlickPhoto: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
}
