//
//  ContentView.swift
//  SwiftUI_Challenge3
//
//  Created by Danil Chernikov on 06.12.2023.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    var body: some View {
        VStack {
            PlayButton()
        }
        .padding()
    }
}

struct PlayButton: View {
    @State fileprivate var isPlay = false
    
    private let iconSize: CGSize = .init(width: 40, height: 50)
    
    var body: some View {
        Button {
            isPlay = false
            withAnimation(.spring(response: 0.7,
                                  dampingFraction: 0.5,
                                  blendDuration: .zero)) {
                isPlay.toggle()
            }
        } label: {
            HStack(spacing: .zero) {
                playIcon
                    .frame(width: isPlay ? iconSize.width : .zero)
                    .opacity(isPlay ? 1 : .zero)
                
                playIcon
                
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 10)) {
                    playIcon
                        .frame(width: isPlay ? .zero : iconSize.width)
                        .scaleEffect(isPlay ? .zero : 1)
                        .opacity(isPlay ? .zero : 1)
                }
            }
        }
    }
    
    @ViewBuilder
    var playIcon: some View {
        Image(systemName: "play.fill")
            .resizable()
            .frame(width: iconSize.width, height: iconSize.height)
    }
}
