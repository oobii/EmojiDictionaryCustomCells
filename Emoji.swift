//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by martynov on 2018-01-22.
//  Copyright © 2018 martynov. All rights reserved.
//

import Foundation


// Our Model

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
}
