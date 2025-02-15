//
//  Helper.swift
//  PetTranslator
//
//  Created by white4ocolate on 13.02.2025.
//

import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

struct UIKitHelper {
    static func openUrl(url: URL) {
        UIApplication.shared.open(url)
    }
}
