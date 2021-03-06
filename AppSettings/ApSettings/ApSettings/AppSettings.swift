//
//  AppSettings.swift
//  ApSettings
//
//  Created by Benson Rukantabula on 29/10/2020.
//  Copyright © 2020 Benson Rukantabula. All rights reserved.
//

import Foundation

final public class AppSettings {
    //private let serialQueue = DispatchQueue(label: "serialQueue")
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    private var settings: [String: Any] = [:]
    
    private init() {}
    
    
    public static let shared = AppSettings()
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async(flags: .barrier) {
            self.settings[key] = value
        }
        
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        
        concurrentQueue.async(flags: .barrier) {
            result = self.settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
