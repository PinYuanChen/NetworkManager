//
// Created on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.request(endpoint: FlickrEndpoint.getSearchResults(searchText: "Cat", page: 1)) {
            (result: Result<FlickrResponse, Error> ) in
            switch result {
                case.success(let response):
                    print("Response: ", response)
                case.failure(let error):
                    print(error)
            }
        }
    }


}

