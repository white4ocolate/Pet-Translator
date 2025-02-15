//
//  SettingsViewModel.swift
//  PetTranslator
//
//  Created by white4ocolate on 11.02.2025.
//

import Foundation
import UIKit
import StoreKit

class SettingsViewModel: ObservableObject {

    // MARK: - Properties
    @Published var isSharing = false
    @Published var showAlert = false
    @Published var alertMessage = ""

    //MARK: - Methods
    func contactUs() {
        guard let url = URL(string: "https://github.com/white4ocolate") else { return }
        UIKitHelper.openUrl(url: url)
    }

    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
        alertMessage = "Can't find purchase"
        showAlert = true
    }
}
