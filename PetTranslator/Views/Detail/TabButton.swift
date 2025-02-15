//
//  TabButton.swift
//  PetTranslator
//
//  Created by white4ocolate on 11.02.2025.
//

import SwiftUI

struct TabButton<Content: View>: View {

    //MARK: - Properties
    let name: String
    let tab: Tab
    @Binding var selectedTab: Tab
    let icon: () -> Content

    //MARK: - View
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                icon()
                    .frame(width: 24, height: 24)
                Text(name)
                    .font(.custom("Konkhmer Sleokchher", size: 12))
            }
        }
        .opacity(selectedTab == tab ? 1 : 0.6)
        .foregroundStyle(CustomColor.customBlack)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.translator))
}
