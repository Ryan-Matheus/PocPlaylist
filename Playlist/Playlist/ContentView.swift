//
//  ContentView.swift
//  Playlist
//
//  Created by Ryan Jesus on 05/02/25.
//

import SwiftUI

struct ContentView: View {
    let mockTracks = [
        Track(number: 1, title: "Tell Me I'm Alive", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: true),
        Track(number: 2, title: "Modern Love", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 3, title: "Dancing With Tears", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 4, title: "Sleepwalking", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false),
        Track(number: 5, title: "Lost in Stereo", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 6, title: "Break Your Little Heart", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 7, title: "Weightless", subtitle: "All Time Low", isExplicit: false, isDownloaded: false, isPlaying: false),
        Track(number: 8, title: "Dear Maria", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 9, title: "Six Feet", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 10, title: "Time-Bomb", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false),
        Track(number: 11, title: "Tell Me I'm Alive", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: true),
        Track(number: 12, title: "Modern Love", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 13, title: "Dancing With Tears", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 14, title: "Sleepwalking", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false),
        Track(number: 15, title: "Lost in Stereo", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 16, title: "Break Your Little Heart", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 17, title: "Weightless", subtitle: "All Time Low", isExplicit: false, isDownloaded: false, isPlaying: false),
        Track(number: 18, title: "Dear Maria", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 19, title: "Six Feet", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 20, title: "Time-Bomb", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(mockTracks) { track in
                        TrackRowView(
                            trackNumber: String(track.number),
                            isPlaying: track.isPlaying,
                            explicit: track.isExplicit,
                            isDownloaded: track.isDownloaded,
                            title: track.title,
                            subtitle: track.subtitle,
                            rightButtonAction: {
                                print("Clicou para mais opções de: \(track.title)")
                            },
                            onTapAction: {
                                print("Tocando \(track.title)")
                            }
                        )
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.black)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Playlist")
                .scrollContentBackground(.hidden)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
