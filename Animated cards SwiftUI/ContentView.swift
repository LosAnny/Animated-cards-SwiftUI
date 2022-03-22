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
                // поворот
                .rotation3DEffect(Angle(degrees: dragState.isActive ? 0 : 30), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .padding(dragState.isActive ?  32 : 64)
                .padding(.bottom, dragState.isActive ? 90 : 100)
                .animation(.spring())
            Card(title: "Second card")
                .rotation3DEffect(Angle(degrees: dragState.isActive ? 0 : 30), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .padding(dragState.isActive ?  16 : 32)
                .padding(.bottom, dragState.isActive ? 0 : 32)
                .animation(.spring())
            MainCard(title: "Main card")
                .rotationEffect(Angle(degrees: Double(dragState.translation.width / 10)))
                .offset(
                      x: dragState.translation.width,
                      y: dragState.translation.height
                   )
                .gesture(dragGester)
                .animation(.spring())
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
