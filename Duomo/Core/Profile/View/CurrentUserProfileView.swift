//
//  CurrentUserProfileView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .posts
    @Namespace var animation
    @State private var showBottomSheet: Bool = false
    
    let username: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // profile header
                    ProfileHeaderView()
                    
                    // post grid view
                    PostGridView()
                    
                }
                .padding(.top)
            }
            .navigationTitle("Base")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showBottomSheet.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                    .sheet(isPresented: $showBottomSheet) {
                        BottomSheetView()
                            .presentationDetents([.fraction(0.24)])
                            .presentationDragIndicator(.hidden)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(username: "username01")
}

struct BottomSheetView: View {
    @State private var showEditProfileView = false
    @State private var showVerifiedAddressesView = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 14) {
                Button(action: {}) {
                    HStack(spacing: 10) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 21, height: 21)
                            .bold()
                        Text("Settings")
                            .font(Font.system(size: 18).bold())
                    }
                }
                Divider()
                Button(action: {
                    showVerifiedAddressesView.toggle()
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                            .resizable()
                            .frame(width: 21, height: 21)
                            .bold()
                        Text("Verified addresses")
                            .font(Font.system(size: 18).bold())
                    }
                }
                .fullScreenCover(isPresented: $showVerifiedAddressesView) {
                    VerifiedAddressesView()
                }
                Divider()
                Button(action: {}) {
                    HStack(spacing: 10) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 21, height: 21)
                            .bold()
                        Text("Logout")
                            .font(Font.system(size: 18).bold())
                    }
                }
                Divider()
            }
            .padding()
        .foregroundColor(.black)
        }
    }
}
