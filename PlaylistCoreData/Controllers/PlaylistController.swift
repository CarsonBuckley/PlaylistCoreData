//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Carson Buckley on 3/13/19.
//  Copyright © 2019 Launch. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {

    //Singleton
    static let sharedInstance = PlaylistController()
    
    //Source of Truth is going to be the MOC
    var playlists: [Playlist] {
        //Form a request to pull playlists off of the hard drive
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        //Deal with the throw
        return(try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    //CRUD
    //Create
    func add(playlistWithTitle title: String) {
        Playlist(title: title)
        //Save
        saveToPersistentStore()
        
    }
    
    //Delete
    func delete(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
        
    }
    
    //Persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function): \n \(error) \n \(error.localizedDescription)")
        }
    }
}
