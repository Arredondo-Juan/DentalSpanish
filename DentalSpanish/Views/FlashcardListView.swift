//
//  FlashcardListView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

struct FlashcardListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel // Inject the EnvironmentObject here
    var deckType: DeckType

    var body: some View {
        List {
            ForEach(flashcards) { flashcard in
                VStack(alignment: .leading) {
                    Text(flashcard.term)
                        .font(.headline)
                    Text(flashcard.definition)
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle(deckType.rawValue)
    }

    var flashcards: [Flashcard] {
        switch deckType {
        case .terms:
            return viewModel.termsDeck
        case .phrases:
            return viewModel.phrasesDeck
        case .custom:
            return viewModel.customDeck
        }
    }
}

#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
