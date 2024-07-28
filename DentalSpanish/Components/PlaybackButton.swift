//
//  PlaybackButton.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/27/24.
//

import SwiftUI

struct PlaybackButton: View {
    let text: String
    
    var body: some View {
        Button(action: {
            SpeechSynthesizerManager.shared.speak(text: text)
        }) {
            Image(systemName: "speaker.3.fill")
                .foregroundColor(.blue)
                .padding()
        }
    }
}

#Preview {
    PlaybackButton(text: "Dentist")
}
