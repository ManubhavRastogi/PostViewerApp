//
//  Post.swift
//  PostViewerApp
//
//  Created by Manubhav Rastogi on 01/10/25.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
