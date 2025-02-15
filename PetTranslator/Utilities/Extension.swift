//
//  Extension.swift
//  PetTranslator
//
//  Created by white4ocolate on 10.02.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let custom = CustomColor()
}

struct CustomColor {
    static let background = LinearGradient(gradient: Gradient(colors: [Color("Background Top"), Color("Background Bottom")]), startPoint: .top, endPoint: .bottom)
    static let customBlack = Color("CustomBlack")
    static let catBackground = Color("CatBackground")
    static let dogBackground = Color("DogBackground")
    static let customPurple = Color("CustomPurple")
}
