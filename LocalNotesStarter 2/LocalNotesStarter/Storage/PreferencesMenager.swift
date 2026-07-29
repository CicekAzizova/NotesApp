//
//  PreferencesMenager.swift
//  LocalNotesStarter
//
//  Created by Cicek on 24.07.26.
//

import Foundation

final class PreferencesMenager {
    
    static let shared = PreferencesMenager()
    
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let isDarkModeEnabled = "isDarkModeEnabled"
    }
    
    private init() { }
    
    var isDarkModeEnabled: Bool  {
        get {
            defaults.bool(forKey: Keys.isDarkModeEnabled)
        }
        set {
            defaults.set(newValue, forKey: Keys.isDarkModeEnabled)
        }
    }
}
