//
// Created on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchForCats()
        searchForDogs()
    }

    func searchForCats() {
        NetworkManager.request(endpoint: FlickrEndpoint.getSearchResults(searchText: "cat", page: 1)) {
            (result: Result<FlickrResponse, Error> ) in
            switch result {
                case.success(let response):
                    print("🐈 Response: ", response)
                case.failure(let error):
                    print(error)
            }
        }
    }

    func searchForDogs() {
        Task { @MainActor in
            let _ = try await NetworkAsyncAwaitManager.request(
                endpoint: FlickrEndpoint.getSearchResults(searchText: "dog", page: 1),
                responseModel: FlickrResponse.self
            )
        }
    }
}

