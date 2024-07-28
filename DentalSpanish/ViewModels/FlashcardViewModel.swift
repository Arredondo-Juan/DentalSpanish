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
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = Bundle.main.url(forResource: "dentalspanishdata", withExtension: "json") else {
                print("Failed to locate file in bundle.")
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let flashcards = try decoder.decode([String: [Flashcard]].self, from: data)
                
                DispatchQueue.main.async {
                    self.termsDeck = flashcards["termsDeck"] ?? []
                    self.phrasesDeck = flashcards["phrasesDeck"] ?? []
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }
    }
    
    func saveFlashcard(_ flashcard: Flashcard) {
        if !savedDeck.contains(flashcard) {
            savedDeck.append(flashcard)
        }
    }
}
