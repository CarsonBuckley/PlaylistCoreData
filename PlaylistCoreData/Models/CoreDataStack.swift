//
//  CoreDataStack.swift
//  PlaylistCoreData
//
//  Created by Carson Buckley on 3/13/19.
//  Copyright © 2019 Launch. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
       let container = NSPersistentContainer(name: "PlaylistCoreData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to Load Persistent Store \(error)")
                
            }
        })
        return container
        
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
}
