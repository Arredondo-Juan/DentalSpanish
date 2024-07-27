//
//  FlashcardViewModel.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

class FlashcardViewModel: ObservableObject {
    @Published var termsDeck: [Flashcard] = []
    @Published var phrasesDeck: [Flashcard] = []
    @Published var savedDeck: [Flashcard] = []
    
    init() {
        loadFlashcards()
    }
    
    func loadFlashcards() {
        if let url = Bundle.main.url(forResource: "dentalspanishdata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let flashcardData = try JSONDecoder().decode(FlashcardData.self, from: data)
                termsDeck = flashcardData.termsDeck
                phrasesDeck = flashcardData.phrasesDeck
            } catch {
                print("Error loading flashcards: \(error)")
            }
        }
    }
    
    func saveFlashcard(_ flashcard: Flashcard) {
        if !savedDeck.contains(flashcard) {
            savedDeck.append(flashcard)
        }
    }
    
    func addCustomFlashcard(_ flashcard: Flashcard) {
    }
}
