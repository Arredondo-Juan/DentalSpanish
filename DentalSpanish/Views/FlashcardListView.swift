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
    
    var body: some View {
        VStack {
            if flashcards.isEmpty {
                Text("No cards available")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ZStack {
                    ForEach(Array(flashcards.enumerated()), id: \.element.id) { index, flashcard in
                        DraggableCardView(flashcards: $flashcards, flashcard: flashcard)
//                            .padding(.horizontal)
//                            .padding(.top, 20)
                    }
                }
                .padding()
                
                Text("Cards left: \(flashcards.count)")
                    .font(.headline)
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
            flashcards = viewModel.termsDeck
        case .phrases:
            flashcards = viewModel.phrasesDeck
        case .saved:
            flashcards = viewModel.savedDeck
        }
    }
}

#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
