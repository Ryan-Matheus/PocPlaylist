//
//  TrackRowView.swift
//  Playlist
//
//  Created by Ryan Jesus on 05/02/25.
//

import SwiftUI

struct TrackRowView: View {
    let trackNumber: String
    let isPlaying: Bool
    let explicit: Bool
    let isDownloaded: Bool
    let title: String
    let subtitle: String
    let rightButtonAction: () -> Void
    let onTapAction: () -> Void
    
    @State private var isPressed = false
    @State private var isOptionPressed = false
    
    private enum Constants {
        static let height: CGFloat = 64
        static let spacing: CGFloat = 16
        static let numberWidth: CGFloat = 24
        static let iconSize: CGFloat = 16
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 8
        static let highlightDuration: CGFloat = 0.15
        
        static let primaryText = Color.white
        static let secondaryText = Color.gray.opacity(0.7)
        static let playingColor = Color.green
        static let highlightColor = Color.gray.opacity(0.15)
    }
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: Constants.highlightDuration)) {
                isPressed = true
            }
            
            onTapAction()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.highlightDuration) {
                withAnimation(.easeOut(duration: Constants.highlightDuration)) {
                    isPressed = false
                }
            }
        }) {
            HStack(spacing: Constants.spacing) {
                Text(trackNumber)
                    .frame(width: Constants.numberWidth)
                    .foregroundColor(Constants.primaryText)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .foregroundColor(Constants.primaryText)
                        .lineLimit(1)
                        .font(.system(size: 16))
                    
                    HStack(spacing: 4) {
                        if isDownloaded {
                            Image("Check")
                                .resizable()
                                .frame(width: Constants.iconSize, height: Constants.iconSize)
                        }
                        
                        if explicit {
                            Image("ExplicitIcon")
                                .resizable()
                                .frame(width: Constants.iconSize, height: Constants.iconSize)
                        }
                        
                        Text(subtitle)
                            .foregroundColor(Constants.secondaryText)
                            .font(.system(size: 14))
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: Constants.highlightDuration)) {
                        isOptionPressed = true
                    }
                    
                    rightButtonAction()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + Constants.highlightDuration) {
                        withAnimation(.easeOut(duration: Constants.highlightDuration)) {
                            isOptionPressed = false
                        }
                    }
                }) {
                    Image("VerticalOptions")
                        .resizable()
                        .frame(width: Constants.iconSize, height: Constants.iconSize)
                        .foregroundColor(.white)
                        .opacity(isOptionPressed ? 0.5 : 1.0)
                }
            }
        }
        .frame(height: Constants.height)
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.black)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(
            .easeInOut(duration: Constants.highlightDuration),
            value: isPressed
        )
    }
}
