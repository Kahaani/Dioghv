//
//  Utilities.swift
//  DioGhvKeyboard
//
//  Created by silly on 11/03/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class Utilities {
    
    static let appGroupIdentifier = "group.sillyplus.Dboard"
    
    class func appGroupContainerURL() -> URL? {
        
        let fileManager = FileManager.default
        
        guard let groupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: Utilities.appGroupIdentifier) else { return nil }
        
        let storagePathURL = groupURL.appendingPathComponent("DboardInputSourceDB")
        let storagePath = storagePathURL.path
        
        if !fileManager.fileExists(atPath: storagePath) {
            do {
                try fileManager.createDirectory(atPath: storagePath, withIntermediateDirectories: false, attributes: nil)
            } catch let error {
                print("Error catching filepath: \(error)")
            }
        }
        
        return storagePathURL
        
    }
    
    class func appGroupContainerPath() -> String? {
        
        return Utilities.appGroupContainerURL()?.path
        
    }
    
}
