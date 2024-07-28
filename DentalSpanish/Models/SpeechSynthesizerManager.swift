//
//  SpeechSynthesizerManager.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/27/24.
//

import AVFoundation

class SpeechSynthesizerManager {
    static let shared = SpeechSynthesizerManager()
    let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    func speak(text: String, language: String = "es-MX") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        synthesizer.speak(utterance)
    }
}
