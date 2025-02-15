//
//  ContentView.swift
//  PetTranslator
//
//  Created by white4ocolate on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var selectedTab: Tab = .translator
    @State private var shouldShowTabBar = true

    //MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.background.ignoresSafeArea()
                VStack {
                    if selectedTab == .translator {
                        TranslatorView(shouldShowTabBar: $shouldShowTabBar)
                    } else {
                        SettingsView()
                    }
                }
                .overlay {
                    if shouldShowTabBar {
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
