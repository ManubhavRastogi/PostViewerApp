//
//  NetworkManager.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//

import Foundation
import Combine

class PostService {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
