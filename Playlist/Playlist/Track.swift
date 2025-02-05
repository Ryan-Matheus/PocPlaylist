//
//  Track.swift
//  Playlist
//
//  Created by Ryan Jesus on 05/02/25.
//

import Foundation

struct Track: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let subtitle: String
    let isExplicit: Bool
    let isDownloaded: Bool 
    var isPlaying: Bool
}
