//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by martynov on 2018-01-22.
//  Copyright © 2018 martynov. All rights reserved.
//

import Foundation


// Our Model 

class Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    static var ArchiveURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    // Saving to the file
    static func saveToFile(emojis: [Emoji]) {
        let propListEncoder = PropertyListEncoder()
        if  let encodedEmojiData = try? propListEncoder.encode(emojis) {
            try? encodedEmojiData.write(to: Emoji.ArchiveURL, options: .noFileProtection)
        }
        
    }
   
    // Loading from the file
    static func loadFromFile() -> [Emoji]? {
        let propListDecoder = PropertyListDecoder()
        
        if let retrievedEmojiData = try? Data(contentsOf: Emoji.ArchiveURL),
            let decodedEmojiArray = try? propListDecoder.decode([Emoji].self, from: retrievedEmojiData) {
            return decodedEmojiArray as [Emoji]?
        }
        else {
            return nil
        }
        
    }
    
    
    static func loadSampleEmojis() -> [Emoji] {
       return  [
            Emoji(symbol: "😀", name: "Grinning face", description: "A typical smiley face", usage: "happiness"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A grey elephant", usage: "Good memory"),
            Emoji(symbol: "🐸", name: "Frog" , description: "Green frog" , usage: "Pond" ),
            Emoji(symbol: "🐢", name: "Turtle" , description: "Wise turtle", usage: "slow"),
            Emoji(symbol: "🍕", name:"Pizza" , description: "Slice of pizza", usage:"Food"),
            Emoji(symbol:"🏐" , name: "Volleyball", description:"White volleyball", usage:"Sports" ),
            Emoji(symbol:"⏰", name:"Alarm clock" , description:"Red clock" , usage:"Waking up"),
            Emoji(symbol:"🇨🇦" , name:"Canada flag", description:"Red and white flag", usage:"Country" ),
            Emoji(symbol:"👀", name:"Eyes" , description:"Two eyes" , usage:"To see" ),
            Emoji(symbol:"🚲" , name:"Bycicle" , description:"Blue bike", usage:"Getting around"),
            Emoji(symbol:"🌈" , name:"Rainbow", description:"seven coulors" , usage:"Rain and sun" ),
            Emoji(symbol:"🎹" , name:"Musical keyboard" , description:"Piano" , usage:"Playing music" ),
            Emoji(symbol:"📎" , name:"Paperclip" , description:"Grey clip" , usage:"Attachment"),
            Emoji(symbol:"💚" , name:"Green heart" , description:"Shape" , usage:"Love" ),
            Emoji(symbol:"🎂" , name:"Birthday cake" , description:"Desert" , usage:"Yummy" ),
            Emoji(symbol:"☃️" , name:"Snowman" , description:"Winter" , usage:"Build" ),
            Emoji(symbol:"🌹" , name:"Rose" , description:"Flower" , usage:"Smells good"),
            Emoji(symbol:"🍍" , name:"Pineapple" , description:"Large fruit" , usage:"Wear a crown" ),
            ]
    }
    
    
}
