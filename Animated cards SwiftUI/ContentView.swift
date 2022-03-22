//
//  ContentView.swift
//  Animated cards SwiftUI
//
//  Created by Анна Лошакова on 22.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Card(title: "Third card")
                .blendMode(.hardLight)
                .padding(64)
                .padding(.bottom, 64)
            Card(title: "Second card")
                .blendMode(.hardLight)
                .padding(32)
                .padding(.bottom, 32)
            MainCard(title: "Main card")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
