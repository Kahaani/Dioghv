//
//  Key.swift
//  DioGhvKeyboard
//
//  Created by silly on 07/03/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

var counter = 0

class Key {
    
    enum KeyType {
        case character
        case specialCharacter
        case shift
        case backspace
        case modeChange
        case keyboardChange
        case period
        case space
        case `return`
        case settings
        case other
    }
    
    var type: KeyType
    var uppercaseKeyCap: String?
    var lowercaseKeyCap: String?
    var uppercaseOutput: String?
    var lowercaseOutput: String?
    var toMode: Int? //if the key is a mode button, this indicates which page it links to
    
    var isCharacter: Bool {
        switch self.type {
        case .character, .specialCharacter, .period:
            return true
        default:
            return false
        }
    }
    
    var isSpecial: Bool {
        switch self.type {
        case .shift:
            return true
        case .backspace:
            return true
        case .modeChange:
            return true
        case .keyboardChange:
            return true
        case .return:
            return true
        case .settings:
            return true
        default:
            return false
        }
    }
    
    var hasOutput: Bool {
        return (self.uppercaseOutput != nil) || (self.lowercaseOutput != nil)
    }
    
    // TODO: this is kind of a hack
    var hashValue: Int
    
    init(_ type: KeyType) {
        self.type = type
        self.hashValue = counter
        counter += 1
    }
    
    convenience init(_ key: Key) {
        self.init(key.type)
        
        self.uppercaseKeyCap = key.uppercaseKeyCap
        self.lowercaseKeyCap = key.lowercaseKeyCap
        self.uppercaseOutput = key.uppercaseOutput
        self.lowercaseOutput = key.lowercaseOutput
        self.toMode = key.toMode
    }
    
    func setLetter(_ letter: String) {
        self.lowercaseOutput = (letter as NSString).lowercased
        self.uppercaseOutput = (letter as NSString).uppercased
        self.lowercaseKeyCap = self.lowercaseOutput
        self.uppercaseKeyCap = self.uppercaseOutput
    }
    
    func outputForCase(_ uppercase: Bool) -> String {
        if uppercase {
            if self.uppercaseOutput != nil {
                return self.uppercaseOutput!
            } else if self.lowercaseOutput != nil {
                return self.lowercaseOutput!
            } else {
                return ""
            }
        }
        else {
            if self.lowercaseOutput != nil {
                return self.lowercaseOutput!
            } else if self.uppercaseOutput != nil {
                return self.uppercaseOutput!
            } else {
                return ""
            }
        }
    }
    
    func keyCapForCase(_ uppercase: Bool) -> String {
        if uppercase {
            if self.uppercaseKeyCap != nil {
                return self.uppercaseKeyCap!
            } else if self.lowercaseKeyCap != nil {
                return self.lowercaseKeyCap!
            } else {
                return ""
            }
        } else {
            if self.lowercaseKeyCap != nil {
                return self.lowercaseKeyCap!
            } else if self.uppercaseKeyCap != nil {
                return self.uppercaseKeyCap!
            } else {
                return ""
            }
        }
    }
}

extension Key: Hashable {
    
    static func ==(lhs: Key, rhs: Key) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}


