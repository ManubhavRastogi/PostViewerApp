//
//  HomeView.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PostsViewModel()
    var body: some View {
        TabView {
            PostsListView(viewModel: viewModel)
                .tabItem {
                    Label("Posts", systemImage: "list.bullet")
                }
            FavoritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}
