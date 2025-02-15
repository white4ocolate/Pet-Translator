//
//  PhrasesModel.swift
//  PetTranslator
//
//  Created by white4ocolate on 13.02.2025.
//

import Foundation

struct PhrasesModel {
    static let phrases = [
        "I love you!",
        "Can I sleep in your bed?",
        "I need more playtime!",
        "Pet me, I deserve it!",
        "I see you’re upset, can I help somehow?",
        "I’m so happy to see you!"
    ]

    static func getPhrase() -> String {
        return phrases.randomElement() ?? "You don't understand me! Your app is broken!"
    }
}


