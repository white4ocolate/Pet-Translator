//
//  RecordView.swift
//  PetTranslator
//
//  Created by white4ocolate on 11.02.2025.
//

import SwiftUI

struct RecordView: View {

    //MARK: - Properties
    @Binding var isRecording: Bool
    @State private var barHeights: [CGFloat] = Array(repeating: 10, count: 35)

    //MARK: - View
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(0..<barHeights.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.blue)
                        .frame(width: 2, height: barHeights[index])
                        .animation(.easeInOut(duration: 0.4), value: barHeights[index])
                }
            }
            .onAppear {
                startUpdatingBars()
            }
        }
    }

    private func startUpdatingBars() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            guard isRecording else { return }
            barHeights = barHeights.map { _ in CGFloat.random(in: 10...50) }
        }
    }
}

#Preview {
    RecordView(isRecording: .constant(false))
}
