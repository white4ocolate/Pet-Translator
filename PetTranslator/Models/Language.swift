//
//  Language.swift
//  PetTranslator
//
//  Created by white4ocolate on 13.02.2025.
//

import Foundation

enum Language {
    case human, pet

    var title: String {
        self == .human ? "Human" : "Pet"
    }
}
