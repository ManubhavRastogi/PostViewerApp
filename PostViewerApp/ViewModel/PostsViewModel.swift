//
//  PostsViewModel.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//


import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var filteredPosts: [Post] = []
    @Published var favorites: Set<Int> = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service = PostService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadFavorites()
    }
    
    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        service.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = "Failed to fetch posts: \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] fetchedPosts in
                self?.posts = fetchedPosts
                self?.filteredPosts = fetchedPosts
            }
            .store(in: &cancellables)
    }
    
    func filterPosts(with searchText: String) {
        if searchText.isEmpty {
            filteredPosts = posts
        } else {
            filteredPosts = posts.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func toggleFavorite(for post: Post) {
        if favorites.contains(post.id) {
            favorites.remove(post.id)
        } else {
            favorites.insert(post.id)
        }
        saveFavorites()
    }
    
    func isFavorite(_ post: Post) -> Bool {
        favorites.contains(post.id)
    }
    
    private func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: "favorites") as? [Int] {
            favorites = Set(saved)
        }
    }
    
    private func saveFavorites() {
        UserDefaults.standard.set(Array(favorites), forKey: "favorites")
    }
    
    func getFavoritePosts() -> [Post] {
        posts.filter { favorites.contains($0.id) }
    }
}
