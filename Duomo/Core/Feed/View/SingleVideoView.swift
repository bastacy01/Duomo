//
//  SingleVideoView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI
import AVKit

struct SingleVideoView: View {
    @Environment(\.dismiss) var dismiss
    let post: Post
    @State private var isLiked = false
    @State private var player: AVPlayer
    
    init(post: Post) {
        self.post = post
        _player = State(initialValue: AVPlayer(url: URL(string: post.videoUrl)!))
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CustomVideoPlayer(player: player)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .offset(x: -10)
//                            .padding(.leading, -20)
                    }
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        Button {

                        } label: {
                            Image("jessepunk")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 42, height: 42)
                                .foregroundStyle(.gray)
                        }
                        
                        Button {
                            isLiked.toggle()
                        } label: {
                            VStack {
                                Image(systemName: isLiked ? "heart.fill" : "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(isLiked ? .red : .white)
                                
                                Text("100")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {

                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("50")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {

                        } label: {
                            VStack {
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .frame(width: 22, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("25")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {

                        } label: {
                            VStack {
                                Image(systemName: "ellipsis")
                                    .font(.title3)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
        .onAppear {
            player.play()
        }
        .onDisappear {
            player.pause()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SingleVideoView(post: Post(id: NSUUID().uuidString, videoUrl: "https://example.com/video1.mov", username: "username01"))
}
