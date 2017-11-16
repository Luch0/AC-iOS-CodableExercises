//
//  Song.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct Song: Codable {
    let song_id: String
    let song_name: String
    let artist_id: String?
    let display_artist: String
    let spotify_id: String?
}
