//
//  PostsListView.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//


import SwiftUI
enum LayoutStyle {
    case list, grid
}

struct PostsListView: View {
    @ObservedObject var viewModel: PostsViewModel
    @State private var searchText = ""
    @State private var isSearchActive: Bool = false
    @State private var layout: LayoutStyle = .list
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Layout", selection: $layout) {
                    Text("List").tag(LayoutStyle.list)
                    Text("Grid").tag(LayoutStyle.grid)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                if isSearchActive {
                    TextField("Search by title", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading posts...")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer(minLength: 30)
                    Image("NoInternet")
                        .frame(width: 40, height: 100)
                        .padding(.bottom, 20)
                    Button(" Try Again ") {
                        viewModel.fetchPosts()
                    }
                    .background(Color(.red))
                    .foregroundStyle(Color(.white))
                    .cornerRadius(5)
                    
                    Spacer()
                } else {
                    ScrollView {
                        if layout == .list {
                            LazyVStack(spacing: 12) {
                                ForEach(viewModel.filteredPosts) { post in
                                    NavigationLink(
                                        destination: PostDetailView(viewModel: viewModel, post: post)
                                    ) {
                                        PostRowView(
                                            post: post,
                                            isFavorite: viewModel.isFavorite(post),
                                            toggleFavorite: { viewModel.toggleFavorite(for: post) }
                                        )
                                    }
                                }
                            }
                            .padding()
                        } else {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(viewModel.filteredPosts) { post in
                                    NavigationLink(
                                        destination: PostDetailView(viewModel: viewModel, post: post)
                                    ){
                                        PostRowView(
                                            post: post,
                                            isFavorite: viewModel.isFavorite(post),
                                            toggleFavorite: { viewModel.toggleFavorite(for: post) }
                                        )
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .onChange(of: searchText) { newValue in
                viewModel.filterPosts(with: newValue)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button(action: {
                                        withAnimation {
                                            isSearchActive.toggle()
                                        }
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                    }
                                }
            }
            .onAppear { viewModel.fetchPosts() }
            .refreshable { viewModel.fetchPosts() }
        }
    }
}
