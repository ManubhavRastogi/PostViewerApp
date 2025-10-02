//
//  PostViewerAppApp.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 30/09/25.
//
//
import SwiftUI

@main
struct PostViewerApp: App {
    @State private var showHome = false

    var body: some Scene {
        WindowGroup {
            if showHome {
                HomeView()
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showHome = true
                            }
                        }
                    }
            }
        }
    }
}

struct SplashView: View {
    var body: some View {
        VStack {
            Text("Welcome to PostViewer")
                .font(.headline)
                .padding(.top, 12)
        }
    }
}
