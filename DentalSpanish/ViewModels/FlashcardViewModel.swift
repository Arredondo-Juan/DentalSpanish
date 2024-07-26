//
//  FlashcardViewModel.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI
import Combine

class FlashcardViewModel: ObservableObject {
    @Published var termsDeck: [Flashcard] = []
    @Published var phrasesDeck: [Flashcard] = []
    @Published var customDeck: [Flashcard] = []

    init() {
        loadDecks()
    }

    func loadDecks() {
        termsDeck = [
            Flashcard(term: "Crown", definition: "Corona"),
            Flashcard(term: "Gums", definition: "Encias")
        ]
        phrasesDeck = [
            Flashcard(term: "Bite down on this gauze.", definition: "Muerda esta gasa."),
            Flashcard(term: "Do you feel any pain when I press here?", definition: "¿Siente dolor cuando presiono aqui?")
        ]
    }

    func addCustomFlashcard(term: String, definition: String) {
        let newFlashcard = Flashcard(term: term, definition: definition)
        customDeck.append(newFlashcard)
        // Save to persistent storage if needed
    }
}

