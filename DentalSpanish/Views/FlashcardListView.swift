//
//  FlashcardListView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

struct FlashcardListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    var deckType: DeckType
    @State private var flashcards: [Flashcard]

    init(deckType: DeckType) {
        self.deckType = deckType
        _flashcards = State(initialValue: [])
    }

    var body: some View {
        ZStack {
            ForEach(flashcards) { flashcard in
                DraggableCardView(flashcards: $flashcards, flashcard: flashcard)
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(width: 300, height: 180)
                .shadow(radius: 5, y: 5)
        }
        .onAppear {
            loadFlashcards()
        }
        .navigationTitle(deckType.rawValue)
    }

    private func loadFlashcards() {
        switch deckType {
        case .terms:
            flashcards = viewModel.termsDeck
        case .phrases:
            flashcards = viewModel.phrasesDeck
        case .custom:
            flashcards = viewModel.customDeck
        }
    }
}

#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
