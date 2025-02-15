//
//  ResultView.swift
//  PetTranslator
//
//  Created by white4ocolate on 12.02.2025.
//

import SwiftUI

struct ResultView: View {
    //MARK: - Properties
    @StateObject private var vm: ResultViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var shouldShowTabBar: Bool

    init(selectedPet: Pet, language: Language, shouldShowTabBar: Binding<Bool>) {
        _vm = StateObject(wrappedValue: ResultViewModel(selectedPet: selectedPet, language: language))
        _shouldShowTabBar = shouldShowTabBar
    }

    //MARK: - View
    var body: some View {
        ZStack {
            CustomColor.background.ignoresSafeArea()
            VStack {
                headerView
                if vm.language == .human { RepeatSound } else { dialogBubble }
                petImage
                Spacer()
            }
        }
        .onAppear {
            shouldShowTabBar = false
            if vm.language == .human { vm.playAudio() }
        }
    }

    private var headerView: some View {
        ZStack {
            HStack {
                closeButton
                Spacer()
            }
            Text("Result")
                .font(.custom("Konkhmer Sleokchher", size: 32))
                .foregroundStyle(CustomColor.customBlack)
        }
        .frame(width: 350, height: 58)
        .padding(.vertical, 12)
    }

    private var closeButton: some View {
        Button {
            dismiss()
            shouldShowTabBar = true
        } label: {
            Image("closeIcon")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.leading, 20)
        }
    }

    private var petImage: some View {
        Image(vm.selectedPet.icon)
            .resizable()
            .frame(width: 184, height: 184)
            .padding(.top, 125)
    }

    private var dialogBubble: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(CustomColor.customPurple)
                .frame(width: 291, height: 142)
                .shadow(color: CustomColor.customBlack.opacity(0.25), radius: 4, x: 0, y: 4)
            Triangle()
                .fill(CustomColor.customPurple)
                .frame(width: 12, height: 169.95)
                .rotationEffect(.degrees(32.62))
                .offset(x: 75, y: 140)
            Text(vm.showPhrase())
                .font(.custom("Konkhmer Sleokchher", size: 12))
                .foregroundStyle(.customBlack)
        }
        .padding(.top, 70)
    }

    private var RepeatSound: some View {
        Button(action: vm.repeatAudio) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(CustomColor.customPurple)
                    .frame(width: 291, height: 54)
                    .shadow(color: CustomColor.customBlack.opacity(0.15), radius: 4, y: 4)
                HStack {
                    Image("repeatIcon")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Repeat")
                        .font(.custom("Konkhmer Sleokchher", size: 12))
                        .foregroundStyle(.customBlack)
                }
            }
        }
        .padding(.top, 167)
    }
}

#Preview {
    ResultView(selectedPet: .dog, language: .human, shouldShowTabBar: .constant(false))
}
