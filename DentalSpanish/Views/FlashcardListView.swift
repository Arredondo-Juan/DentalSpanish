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
    @State private var flashcards: [Flashcard] = []

    init(deckType: DeckType) {
        self.deckType = deckType
    }

    var body: some View {
        VStack {
            ZStack {
                ForEach(Array(flashcards.enumerated()), id: \.element.id) { index, flashcard in
                    DraggableCardView(flashcards: $flashcards, flashcard: flashcard)
                        .offset(x: CGFloat(index) * 5, y: CGFloat(index) * 5)
                        .scaleEffect(1 - CGFloat(index) * 0.02)
                }
            }
            .padding()
            
            if !flashcards.isEmpty {
                Text("Cards left: \(flashcards.count)")
                    .font(.subheadline)
                    .padding(.top)
            }
        }
        .onAppear {
            loadFlashcards()
        }
        .navigationTitle(deckType.rawValue)
    }

    private func loadFlashcards() {
        switch deckType {
        case .terms:
            print("Loading terms deck")
            flashcards = viewModel.termsDeck
        case .phrases:
            print("Loading phrases deck")
            flashcards = viewModel.phrasesDeck
        case .custom:
            print("Loading custom deck")
            flashcards = viewModel.customDeck
        case .saved:
            print("Loading saved deck")
            flashcards = viewModel.savedDeck
        }
        print("Loaded flashcards: \(flashcards.count)")
    }
}


#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
