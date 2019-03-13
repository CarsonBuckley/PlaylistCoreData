//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Carson Buckley on 3/13/19.
//  Copyright © 2019 Launch. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithTitle title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    static func delete(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
}
