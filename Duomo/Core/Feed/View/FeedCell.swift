//
//  FeedCell.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var player: AVPlayer
    @State private var showPopUp = false
    @State private var currentStep = 0
    @State private var isLiked = false

    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
        _isLiked = State(initialValue: post.liked)
    }

    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        NavigationLink(destination: CurrentUserProfileView(username: post.username)) {
                            Text("@\(post.username)")
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        
                        Button {
                            withAnimation {
                                showPopUp.toggle()
                            }
                        } label: {
                            Image("baselogo")
                                .resizable()
                                .frame(width: 40, height: 40)
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
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
            
            if showPopUp {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showPopUp.toggle()
                            currentStep = 0
                        }
                    }
                
                GeometryReader { geometry in
                    VStack {
                        if currentStep == 0 {
                            StepOneView(showPopUp: $showPopUp, currentStep: $currentStep)
                        } else if currentStep == 1 {
                            StepTwoView()
                        } else {
                            StepThreeView(showPopUp: $showPopUp, currentStep: $currentStep)
                        }
                        
                        if currentStep != 0 && currentStep != 2 {
                            HStack {
                                Button(action: {
                                    if currentStep > 0 {
                                        withAnimation {
                                            currentStep -= 1
                                        }
                                    }
                                }) {
                                    Text("Cancel")
                                        .padding()
                                        .frame(width: 138, height: 45)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        .offset(x: 3)
                                        .font(.system(size: 16).bold())
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    if currentStep < 2 {
                                        withAnimation {
                                            currentStep += 1
                                        }
                                    } else {
                                        withAnimation {
                                            showPopUp.toggle()
                                            currentStep = 0
                                        }
                                    }
                                }) {
                                    Text(currentStep == 2 ? "Done" : "Confirm")
                                        .padding()
                                        .frame(width: 138, height: 45)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        .offset(x: -3)
                                        .font(.system(size: 16).bold())
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 20)
                    .transition(.scale)
                    .offset(x: 48, y: 160)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
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
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: "", username: "username01"), player: AVPlayer())
}

struct StepOneView: View {
    @Binding var showPopUp: Bool
    @Binding var currentStep: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Send")
                    .font(.headline)
                    .padding()
                Spacer()
                Image(systemName: "x.circle")
                    .padding()
                    .font(.system(size: 18).bold())
                    .onTapGesture {
                        withAnimation {
                            showPopUp = false
                            currentStep = 0
                        }
                    }
            }
            .offset(y: 18)
            
            HStack(spacing: -14) {
                Text("10")
                    .font(.system(size: 48))
                    .padding()
                Text("USD")
                    .font(.system(size: 48))
                    .foregroundStyle(.gray)
            }
            .offset(x: -60, y: -25)
            
            HStack(spacing: 3) {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 12))
                    .foregroundStyle(.blue)
                Text("10 USDC")
                    .fontWeight(.medium)
                    .foregroundStyle(.blue)
            }
            .font(.system(size: 13))
            .offset(x: -95, y: -35)
            
            HStack {
                Image("usdclogo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -5, y: -24)
                VStack {
                    HStack(spacing: 140) {
                        Text("Send")
                            .font(.system(size: 15).bold())
                        Text("$10.99")
                            .font(.system(size: 14))
                    }
                    HStack(spacing: 120) {
                        Text("USDC")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                        Text("Available")
                            .font(.system(size: 14))
                            .padding(.leading, 3)
                    }
                }
                .offset(y: -25)
                
            }
            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 31))
                    .offset(x: -4)
                VStack(alignment: .leading, spacing: -1) {
                    Text("To")
                        .font(.system(size: 15).bold())
                    Text("username.eth")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            .offset(x: -63, y: -8)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentStep += 1
                }
            }) {
                HStack {
                    Text("Preview Send")
                        .padding()
                        .font(.system(size: 13)).bold()
                    Spacer()
                    Image(systemName: "arrow.right")
                        .padding()
                }
                .frame(width: 260, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding()
            .background(Color.white)
            .offset(y: -15)

        }
    }
}



struct StepTwoView: View {
    var body: some View {
        VStack {
            HStack {
                Image("usdclogo")
                    .resizable()
                    .frame(width: 31, height: 31)

                VStack(spacing: 4) {
                    HStack(spacing: 140) {
                        Text("Base")
                            .font(.system(size: 15).bold())
                            .offset(x: -19)
                        VStack {
                            Text("$10.00")
                                .font(.system(size: 14))
                            Text("USDC")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .offset(x: 3)
                        }
                        .offset(x: -30)
                    }
                }

                .padding()
                .background(Color.white)
            }
            .padding(.top, 20)
            .offset(x: 20)
            
            Image(systemName: "arrow.down")
                .font(.subheadline)
                .fontWeight(.medium)
                .offset(x: -110, y: -8)
                
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 31))
                    .offset(y: -15)
                VStack {
                    Text("username.eth")
                        .font(.system(size: 15).bold())
                        .offset(x: -20, y: -15)
                }
                .padding()
                .background(Color.white)
            }
            .offset(x: -40, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 0.5)
                    .frame(width: 280, height: 130)
                    .offset(y: -43)
            )
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 80) {
                    Text("Wallet used")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .offset(x: -12)
                    Text("0x00a7...75FC")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .offset(x: 10)
                }
                HStack(spacing: 80) {
                    Text("Network")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .offset(x: -12)
                    Text("Base")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .offset(x: 90)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct StepThreeView: View {
    @Binding var showPopUp: Bool
    @Binding var currentStep: Int
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "ellipsis")
                .font(.system(size: 28))
                .foregroundStyle(.blue)
            Text("You are sending to username.eth")
                .font(.system(size: 15).bold())
            Text("0x838a...B4D9")
                .font(.system(size: 12))
            Text("10 USDC ($10.00)")
                .font(.system(size: 25).bold())
                .foregroundStyle(.blue)
            
            VStack(spacing: -3) {
                Button(action: {
                    withAnimation {
                        showPopUp = false
                        currentStep = 0
                    }
                }) {
                    Text("Done")
                        .font(.system(size: 16).bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(25)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    
                }) {
                    Text("See transaction")
                        .font(.system(size: 16).bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(25)
                }
            }
            .padding(.horizontal)
            .offset(y: 20)
        }
    }
}
