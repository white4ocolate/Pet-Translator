//
//  SettingButton.swift
//  PetTranslator
//
//  Created by white4ocolate on 13.02.2025.
//

import SwiftUI

struct SettingButton: View {

    //MARK: - Properties
    let title: String

    //MARK: - View
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .fontWeight(.regular)
                .font(.system(size: 16))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 24))
        }
        .padding(.horizontal, 16)
        .frame(height: 50)
        .background(CustomColor.customPurple)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SettingButton(title: "Rate Us")
}
