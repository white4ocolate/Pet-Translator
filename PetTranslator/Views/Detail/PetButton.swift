//
//  PetButton.swift
//  PetTranslator
//
//  Created by white4ocolate on 11.02.2025.
//

import SwiftUI

struct PetButton: View {

    //MARK: - Properties
    @Binding var selectedPet: Pet
    let pet: Pet

    //MARK: - View
    var body: some View {
        Button {
            selectedPet = pet
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(pet.background)
                    .frame(width: 70, height: 70)
                Image(pet.icon)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
        .opacity(selectedPet == pet ? 1 : 0.6)
    }
}

#Preview {
    PetButton(selectedPet: .constant(.cat), pet: .cat)
    PetButton(selectedPet: .constant(.dog), pet: .dog)
}
