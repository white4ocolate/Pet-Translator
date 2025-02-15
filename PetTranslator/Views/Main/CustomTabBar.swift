//
//  CustomTabBar.swift
//  PetTranslator
//
//  Created by white4ocolate on 10.02.2025.
//

import SwiftUI

struct CustomTabBar: View {

    //MARK: - Properties
    @Binding var selectedTab: Tab

    //MARK: - View
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 216, height: 82)

            HStack(spacing: 42) {
                TabButton(name: "Translator", tab: .translator, selectedTab: $selectedTab) {
                    AnyView(Image("messagesIcon").resizable())
                }

                TabButton(name: "Clicker", tab: .settings, selectedTab: $selectedTab) {
                    AnyView(Image("gearIcon").resizable())
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.translator))
}
