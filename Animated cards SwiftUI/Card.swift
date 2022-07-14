//
//  Card.swift
//  Animated cards SwiftUI
//
//  Created by Анна Лошакова on 22.03.2022.
//

import SwiftUI

struct Card: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 68 / 255, green: 41 / 255, blue: 182 / 255))
                .frame(height: 230)
                .cornerRadius(10)
                .padding(16)
            Text(title)
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
        }
    }
}
