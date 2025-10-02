//
//  PostRowView.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text(post.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
                Text("User ID: \(post.userId)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .scaleEffect(isFavorite ? 1.2 : 1.0)
                .onTapGesture {
                    withAnimation(.spring()) {
                        toggleFavorite()
                    }
                }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}
