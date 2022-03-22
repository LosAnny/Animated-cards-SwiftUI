//
//  ContentView.swift
//  Animated cards SwiftUI
//
//  Created by Анна Лошакова on 22.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState var dragState = DragState.inactive
    
    var body: some View {
        
        // Инициализируем жест и обновляем dragState
        let dragGester = DragGesture()
           .updating($dragState) { (value, state, transaction) in
              state = .dragging(translation: value.translation)
           }
        
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
                .offset(
                      x: dragState.translation.width,
                      y: dragState.translation.height
                   )
                .gesture(dragGester)
        }
    }
}

enum DragState {

        case inactive
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
