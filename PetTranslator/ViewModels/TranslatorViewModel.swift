//
//  TranslatorViewModel.swift
//  PetTranslator
//
//  Created by white4ocolate on 12.02.2025.
//

import Foundation
import UIKit
import Combine

@MainActor
class TranslatorViewModel: ObservableObject {

    //MARK: - Properties
    @Published var isMicrophoneGranted = false
    @Published var isRecord = false
    @Published var shouldShowSettingsAlert = false
    @Published var navigateToResult = false
    @Published var selectedPet: Pet = .dog
    @Published var language: Language = .pet
    @Published var isProcess: Bool = false

    private let permissionManager = PermissionManager()
    private var cancellables = Set<AnyCancellable>()


    init() {
        bindPermissions()
    }

    //MARK: - Methods
    func startRecord() {
        permissionManager.requestPermission(for: .microphone) { [weak self] granted in
            guard let self else { return }
            if granted {
                self.isRecord = true
            } else {
                self.shouldShowSettingsAlert = true
            }
        }
    }

    func stopRecord() {
        Task { @MainActor in
            isRecord = false
            isProcess = true
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            isProcess = false
            navigateToResult = true
        }
    }

    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    //MARK: - Private Methods
    private func bindPermissions() {
        permissionManager.$isMicrophoneGranted
            .receive(on: DispatchQueue.main)
            .assign(to: \.isMicrophoneGranted, on: self)
            .store(in: &cancellables)

        permissionManager.$shouldShowSettingsAlert
            .receive(on: DispatchQueue.main)
            .assign(to: \.shouldShowSettingsAlert, on: self)
            .store(in: &cancellables)
    }
}
