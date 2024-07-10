//
//  PostGridView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI
import AVKit

struct PostGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible())
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 10
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            if let videoURL = Bundle.main.url(forResource: "video1", withExtension: "mov") {
                let post = Post(id: NSUUID().uuidString, videoUrl: videoURL.absoluteString, username: "username01")
                NavigationLink(destination: SingleVideoView(post: post)) {
                    ZStack {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(width: width, height: 160)
                            .clipped()
                        
                        VStack {
                            Spacer()
                            HStack(spacing: 2) {
                                Image(systemName: "play")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12).bold())
                                Text("1.1M")
                                    .foregroundColor(.white).bold()
                                    .font(.system(size: 12))
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                
            }
            
            ForEach(1 ..< 1) { _ in
                Rectangle()
                    .frame(width: width, height: 160)
                    .clipped()
                    .background(Color.gray)
            }
        }
    }
}

#Preview {
    PostGridView()
}
