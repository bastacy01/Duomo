//
//  Post.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let videoUrl: String
    let username: String
    var liked: Bool = false
}
