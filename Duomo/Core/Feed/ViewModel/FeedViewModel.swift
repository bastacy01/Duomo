//
//  FeedViewModel.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: Bundle.main.url(forResource: "video1", withExtension: "mov")!.absoluteString, username: "username01"),
            .init(id: NSUUID().uuidString, videoUrl: Bundle.main.url(forResource: "video4", withExtension: "mov")!.absoluteString, username: "username02"),
            .init(id: NSUUID().uuidString, videoUrl: Bundle.main.url(forResource: "video2", withExtension: "mov")!.absoluteString, username: "username03")
        ]
    }
}
