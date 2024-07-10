//
//  TweetFilterViewModel.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case posts
    case replies
    case likes
    case entries

    var imageName: String {
        switch self {
        case .posts: return "list.dash"
        case .replies: return "bubble.right"
        case .likes: return "heart.slash"
        case .entries: return "lock.slash"
        }
    }
}
