//
//  UserStatView.swift
//  Duomo
//
//  Created by Ben Stacy on 6/1/24.
//

import SwiftUI

struct UserStatView: View {
    let value: String
    let title: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(value: "1.5M", title: "Followers")
}
