//
//  ResultViewModel.swift
//  PetTranslator
//
//  Created by white4ocolate on 12.02.2025.
//

import Foundation
import AVFoundation

class ResultViewModel: ObservableObject {

    //MARK: - Properties
    private var audioPlayer: AVAudioPlayer?
    private var lastPlayedFile: String?
    let selectedPet: Pet
    let language: Language

    init(selectedPet: Pet, language: Language) {
        self.selectedPet = selectedPet
        self.language = language
    }

    //MARK: - Methods
    func playAudio() {
        guard let fileName = generateFileName(for: selectedPet) else { return }
        lastPlayedFile = fileName
        play(fileName: fileName)
    }

    func repeatAudio() {
        guard let lastPlayedFile else { return }
        play(fileName: lastPlayedFile)
    }

    func showPhrase() -> String {
        PhrasesModel.getPhrase()
    }

    //MARK: - Private methods
    private func play(fileName: String) {
        setupAudioSession()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else {
            print("Can't find \(fileName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            audioPlayer = nil
            print("Audio play error: \(error.localizedDescription)")
        }
    }

    private func setupAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)
        } catch {
            print("Audio session error: \(error.localizedDescription)")
        }
    }

    private func generateFileName(for pet: Pet) -> String? {
        switch pet {
        case .cat: return "cat\(Int.random(in: 1...4))"
        case .dog: return "dog\(Int.random(in: 1...4))"
        }
    }
}
