//
//  ContentView.swift
//  Playlist
//
//  Created by Ryan Jesus on 05/02/25.
//

import SwiftUI

struct ContentView: View {
    let numberTracks = [
        Track(number: 1, title: "Tell Me I'm Alive", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: true),
        Track(number: 2, title: "Modern Love", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 3, title: "Dancing With Tears", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 4, title: "Sleepwalking", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false)
    ]
    
    let imageTracks = [
        Track(number: 5, title: "Lost in Stereo", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, image: "TestImage", isPlaying: false),
        Track(number: 6, title: "Break Your Little Heart", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, image: "TestImage", isPlaying: false),
        Track(number: 7, title: "Weightless", subtitle: "All Time Low", isExplicit: false, isDownloaded: false, image: "TestImage", isPlaying: false),
        Track(number: 8, title: "Dear Maria", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, image: "TestImage", isPlaying: false)
    ]
    
    let numberImageTracks = [
        Track(number: 9, title: "Six Feet", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, image: "TestImage", isPlaying: false),
        Track(number: 10, title: "Time-Bomb", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, image: "TestImage", isPlaying: false),
        Track(number: 11, title: "Tell Me I'm Alive", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, image: "TestImage", isPlaying: false),
        Track(number: 12, title: "Modern Love", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, image: "TestImage", isPlaying: false)
    ]
    
    let simpleTracks = [
        Track(number: 13, title: "Dancing With Tears", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false),
        Track(number: 14, title: "Sleepwalking", subtitle: "All Time Low", isExplicit: false, isDownloaded: true, isPlaying: false),
        Track(number: 15, title: "Lost in Stereo", subtitle: "All Time Low", isExplicit: true, isDownloaded: false, isPlaying: false),
        Track(number: 16, title: "Break Your Little Heart", subtitle: "All Time Low", isExplicit: true, isDownloaded: true, isPlaying: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                List {
                    NumberTracksSection(tracks: numberTracks)
                    ImageTracksSection(tracks: imageTracks)
                    NumberImageTracksSection(tracks: numberImageTracks)
                    SimpleTracksSection(tracks: simpleTracks)
                }
                .listStyle(.plain)
                .navigationTitle("Playlist")
                .scrollContentBackground(.hidden)
            }
        }
        .preferredColorScheme(.dark)
    }
}

// Seções separadas
struct NumberTracksSection: View {
    let tracks: [Track]
    
    var body: some View {
        Section(header: Text("Tipo 1: Número + Título").foregroundColor(.gray)) {
            ForEach(tracks) { track in
                TrackRowView(
                    title: track.title,
                    subtitle: track.subtitle,
                    rightButtonAction: { print("Opções: \(track.title)") },
                    onTapAction: { print("Tocando: \(track.title)") },
                    trackNumber: String(track.number),
                    isPlaying: track.isPlaying,
                    explicit: track.isExplicit,
                    isDownloaded: track.isDownloaded
                )
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }
        }
    }
}

struct ImageTracksSection: View {
    let tracks: [Track]
    
    var body: some View {
        Section(header: Text("Tipo 2: Imagem  + Título").foregroundColor(.gray)) {
            ForEach(tracks) { track in
                TrackRowView(
                    title: track.title,
                    subtitle: track.subtitle,
                    rightButtonAction: { print("Opções: \(track.title)") },
                    onTapAction: { print("Tocando: \(track.title)") },
                    image: track.image,
                    isPlaying: track.isPlaying,
                    explicit: track.isExplicit,
                    isDownloaded: track.isDownloaded
                )
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }
        }
    }
}

struct NumberImageTracksSection: View {
    let tracks: [Track]
    
    var body: some View {
        Section(header: Text("Tipo 3: Número + imagem + Título").foregroundColor(.gray)) {
            ForEach(tracks) { track in
                TrackRowView(
                    title: track.title,
                    subtitle: track.subtitle,
                    rightButtonAction: { print("Opções: \(track.title)") },
                    onTapAction: { print("Tocando: \(track.title)") },
                    trackNumber: String(track.number),
                    image: track.image,
                    isPlaying: track.isPlaying,
                    explicit: track.isExplicit,
                    isDownloaded: track.isDownloaded
                )
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }
        }
    }
}

struct SimpleTracksSection: View {
    let tracks: [Track]
    
    var body: some View {
        Section(header: Text("Tipo 4: Apenas Título").foregroundColor(.gray)) {
            ForEach(tracks) { track in
                TrackRowView(
                    title: track.title,
                    subtitle: track.subtitle,
                    rightButtonAction: { print("Opções: \(track.title)") },
                    onTapAction: { print("Tocando: \(track.title)") },
                    isPlaying: track.isPlaying,
                    explicit: track.isExplicit,
                    isDownloaded: track.isDownloaded
                )
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }
        }
    }
}

