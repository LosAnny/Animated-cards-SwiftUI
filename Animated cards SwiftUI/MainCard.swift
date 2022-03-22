//
//  MainCard.swift
//  Animated cards SwiftUI
//
//  Created by Анна Лошакова on 22.03.2022.
//

import SwiftUI

struct MainCard: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(height: 230)
                .cornerRadius(10)
                .padding(16)
            Text(title)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .bold()
        }
    }
}
