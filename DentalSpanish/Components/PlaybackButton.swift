//
//  PlaybackButton.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/27/24.
//

import SwiftUI
import AVFoundation

struct PlaybackButton: View {
    
    let text: String
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        Button(action: {
            speak(text:text)
        }) {
            Image(systemName: "speaker.wave.2")
                .foregroundColor(.black)
                .padding()
        }
    }
    
    private func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        synthesizer.speak(utterance)
    }
}

#Preview {
    PlaybackButton(text: "Dentist")
}
