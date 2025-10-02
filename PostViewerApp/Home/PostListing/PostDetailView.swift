//
//  PostDetailView.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//


import SwiftUI

struct PostDetailView: View {
    @ObservedObject var viewModel: PostsViewModel
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(post.title)
                .font(.largeTitle)
            Text(post.body)
                .font(.body)
            Button(action: {
                viewModel.toggleFavorite(for: post)
            }) {
                Image(systemName: viewModel.isFavorite(post) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .font(.title)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Post Details")
    }
}
