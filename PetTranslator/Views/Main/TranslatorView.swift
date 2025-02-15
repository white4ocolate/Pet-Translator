//
//  TranslatorView.swift
//  PetTranslator
//
//  Created by white4ocolate on 10.02.2025.
//

import SwiftUI

struct TranslatorView: View {

    //MARK: - Properties
    @StateObject private var vm: TranslatorViewModel
    @Binding var shouldShowTabBar: Bool

    init(shouldShowTabBar: Binding<Bool>) {
        _vm = StateObject(wrappedValue: TranslatorViewModel())
        _shouldShowTabBar = shouldShowTabBar
    }

    //MARK: - View
    var body: some View {
        ZStack {
            CustomColor.background.ignoresSafeArea()
            VStack {
                if vm.isProcess {
                    processTranslating
                } else {
                    translationButtons
                }
                Image(vm.selectedPet.icon)
                    .resizable()
                    .frame(width: 184, height: 184)
                    .padding(.top, 51)
                    .padding(.bottom, 36)
                Spacer()
            }
        }
        .animation(.easeInOut(duration: 0.2), value: vm.isProcess)
        .onAppear{
            shouldShowTabBar = true
        }
    }

    private func toggleLanguage() {
        vm.language = vm.language == .human ? .pet : .human
    }

    private func languageText(_ text: String) -> some View {
        Text(text)
            .font(.custom("Konkhmer Sleokchher", size: 16))
            .textCase(.uppercase)
            .frame(width: 135, height: 61)
    }

    private var processTranslating: some View {
        Text("Process of translation...")
            .font(.custom("Konkhmer Sleokchher", size: 16))
            .foregroundStyle(CustomColor.customBlack)
            .padding(.top, 343)
            .padding(.bottom, 20)
    }

    private var translationButtons: some View {
        VStack {
            Text("Translator")
                .font(.custom("Konkhmer Sleokchher", size: 32))
                .frame(width: 350, height: 58)
                .padding(.vertical, 12)

            HStack {
                languageText(vm.language.title)
                Button {
                    toggleLanguage()
                } label: {
                    Image("arrowsIcon")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .disabled(vm.isRecord)
                .frame(width: 24, height: 24)
                languageText(vm.language == .human ? "Pet" : "Human")
            }
            .padding(.bottom, 58)

            HStack(spacing: 35) {
                recordButton
                petSelector
            }
        }
        .foregroundStyle(CustomColor.customBlack)
        .navigationDestination(isPresented: $vm.navigateToResult) {
            ResultView(selectedPet: vm.selectedPet, language: vm.language, shouldShowTabBar: $shouldShowTabBar)
                .navigationBarBackButtonHidden()
        }
    }

    private var recordButton: some View {
        Button {
            vm.isRecord ? vm.stopRecord() : vm.startRecord()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)
                VStack{
                    ZStack {
                        RecordView(isRecording: $vm.isRecord)
                            .frame(width: 70, height: 70)
                            .padding(.top, 44)
                            .opacity(vm.isRecord ? 1 : 0)

                        Image("microphoneIcon")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(.top, 44)
                            .opacity(vm.isRecord ? 0 : 1)
                    }

                    Text(vm.isRecord ? "Recording..." : "Start Speak")
                        .font(.custom("Konkhmer Sleokchher", size: 16))
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom, 16)
                }
            }
        }
        .frame(width: 178, height: 176)
        .alert("Microphone Access Denied", isPresented: $vm.shouldShowSettingsAlert) {
            Button("Settings") { vm.openSettings() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please allow microphone access in Settings.")
        }
    }

    private var petSelector: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 107, height: 176)
                .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)

            VStack(spacing: 12) {
                PetButton(selectedPet: $vm.selectedPet, pet: .cat)
                PetButton(selectedPet: $vm.selectedPet, pet: .dog)
            }
            .disabled(vm.isRecord)
        }
    }
}

#Preview {
    TranslatorView(shouldShowTabBar: .constant(true))
}
