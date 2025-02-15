//
//  PermissionManager.swift
//  PetTranslator
//
//  Created by white4ocolate on 12.02.2025.
//

import AVFoundation

enum PermissionType {
    case microphone
}

@MainActor
class PermissionManager: ObservableObject {
    @Published var isMicrophoneGranted: Bool = false
    @Published var shouldShowSettingsAlert: Bool = false

    func requestPermission(for type: PermissionType, completion: @escaping (Bool) -> Void) {
        switch type {
        case .microphone:
            requestMicrophoneAccess(completion: completion)
        }
    }

    private func requestMicrophoneAccess(completion: @escaping (Bool) -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .audio) {
        case .authorized:
            isMicrophoneGranted = true
            completion(true)
        case .denied, .restricted:
            isMicrophoneGranted = false
            shouldShowSettingsAlert = true
            completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) { [weak self] granted in
                Task { @MainActor in
                    self?.isMicrophoneGranted = granted
                    if !granted {
                        self?.shouldShowSettingsAlert = true
                    }
                    completion(granted)
                }
            }
        @unknown default:
            completion(false)
        }
    }
}
