//
//  FavoritesView.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//


import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: PostsViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.getFavoritePosts().isEmpty {
                VStack {
                    Image(systemName: "heart.slash")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .padding(.bottom, 12)
                    Text("No favorites yet!")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
            } else {
                List {
                    ForEach(viewModel.getFavoritePosts()) { post in
                        PostRowView(
                            post: post,
                            isFavorite: true,
                            toggleFavorite: { viewModel.toggleFavorite(for: post) }
                        )
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Favorites")
            }
        }
    }
}
