//
//  SettingsView.swift
//  PetTranslator
//
//  Created by white4ocolate on 10.02.2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    // MARK: - Properties
    @StateObject private var vm = SettingsViewModel()
    @Environment(\.requestReview) var requestReview

    // MARK: - View
    var body: some View {
        ZStack {
            CustomColor.background.ignoresSafeArea()
            VStack {
                titleView
                settingsList
            }
            .frame(maxHeight: .infinity)
            .foregroundStyle(CustomColor.customBlack)
        }
    }

    private var titleView: some View {
        Text("Settings")
            .bold()
            .frame(width: 350, height: 58)
            .font(.system(size: 32, weight: .regular))
            .foregroundStyle(CustomColor.customBlack)
            .padding(.vertical, 12)
    }

    private var settingsList: some View {
        List {
            settingsButton(title: "Rate Us", action: { requestReview() })
            settingsButton(title: "Share App", action: { vm.isSharing = true })
                .sheet(isPresented: $vm.isSharing) {
                    ShareSheet(activityItems: ["Try this awesome app!"])
                }
            settingsButton(title: "Contact Us", action: vm.contactUs)
            settingsButton(title: "Restore Purchase", action: vm.restorePurchases)
                .alert(isPresented: $vm.showAlert) {
                    Alert(title: Text("Restoring"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
                }
            settingsButton(title: "Privacy Policy", action: vm.contactUs)
            settingsButton(title: "Terms of use", action: vm.contactUs)
        }
        .listStyle(.plain)
        .modifier(ItemModifier())
    }

    private func settingsButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            SettingButton(title: title)
        }
        .modifier(ItemModifier())
    }
}

//MARK: - ItemModifier
struct ItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .scrollContentBackground(.hidden)
    }
}

#Preview {
    SettingsView()
}
