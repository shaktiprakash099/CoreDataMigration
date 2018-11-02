//
//  DataController.swift
//  Mooskine
//
//  Created by GLB-253 on 10/29/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData
class DataController {
    
    let persistentContainer:NSPersistentContainer
    
    var backgroundContext:NSManagedObjectContext!
    init(modelName:String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        backgroundContext = persistentContainer.newBackgroundContext()
    }
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func configureContexts(){
        backgroundContext = persistentContainer.newBackgroundContext()
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        
    }
    func load(completion:(()->Void)? = nil){
        persistentContainer.loadPersistentStores { (storeDescription, error ) in
          
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
}

extension DataController {
    func autoSaveViewContext(interval:TimeInterval = 30){
        print("autosaving")
        guard interval > 0 else{
            print("can not set negative autosave interval")
            return
        }
        if viewContext.hasChanges {
        try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
