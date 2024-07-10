//
//  UserCell.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("jessepunk")
                .resizable()
                .clipShape(Circle())
                .frame(width: 42, height: 42)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text("username01")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Base")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
