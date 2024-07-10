//
//  ProfileHeaderView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfileView = false
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image("jessepunk")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                Text("@username01")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16) {
                UserStatView(value: "1", title: "Following")
                UserStatView(value: "55K", title: "Followers")
                UserStatView(value: "1.6M", title: "Likes")
            }
            
            Button {
                showEditProfileView.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .fullScreenCover(isPresented: $showEditProfileView, onDismiss: {
            }) {
                EditProfileView()
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
