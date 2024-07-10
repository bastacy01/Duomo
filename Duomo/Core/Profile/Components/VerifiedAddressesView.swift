//
//  VerifiedAddressesView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI

struct VerifiedAddressesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add a proof of ownership of an Ethereum or Coinbase small wallet account to your profile.")
                    .font(.subheadline)
                    .padding(.horizontal, 13)
                    .padding(.top, 10)

                HStack(spacing: 4) {
                    Image("ethlogo")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .offset(y: 7)
                    Text("0xa34F...4dbD")
                        .font(.subheadline)
                        .padding(.top, 15)
                    Image(systemName: "arrow.up.forward.app")
                        .font(.subheadline)
                        .padding(.top, 14)
                    
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 90, height: 40)
                        .foregroundStyle(.red)
                        .overlay(
                            Text("Remove")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                        )
                }
                .padding()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 0.5)
                    .offset(y: -18)
                
                HStack(spacing: 7) {
                    Image("coinbaselogo")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .offset(y: 7)
                        .foregroundStyle(.black)
                    Text("username.eth")
                        .font(.subheadline)
                        .padding(.top, 15)
                    Image(systemName: "arrow.up.forward.app")
                        .font(.subheadline)
                        .padding(.top, 14)
                    
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 90, height: 40)
                        .foregroundStyle(.red)
                        .overlay(
                            Text("Remove")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                        )
                }
                .padding()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 0.5)
                    .offset(y: -18)
                
                Spacer()

                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 50)
                        .overlay(
                            Text("Verify another address")
                                .foregroundStyle(.white)
                                .font(.headline)
                        )
                }
                .padding(.bottom)
                
            }
            .navigationTitle("Verified Addresses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    VerifiedAddressesView()
}
