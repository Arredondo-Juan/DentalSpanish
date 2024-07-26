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

    var body: some View {
        TabView {
            ForEach(flashcards) { flashcard in
                FlashcardView(flashcard: flashcard)
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
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
