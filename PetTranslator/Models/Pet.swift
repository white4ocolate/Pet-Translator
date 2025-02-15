//
//  Pet.swift
//  PetTranslator
//
//  Created by white4ocolate on 13.02.2025.
//

import SwiftUICore

enum Pet {
    case cat, dog

    var icon: String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }

    var background: Color {
        switch self {
        case .cat:
            return CustomColor.catBackground
        case .dog:
            return CustomColor.dogBackground
        }
    }
}
