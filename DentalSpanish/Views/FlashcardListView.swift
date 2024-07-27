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
            if deckType == .custom {
                NavigationLink(destination: AddCustomFlashcardView()
                    .environmentObject(viewModel)) {
                        VStack {
                            if flashcards.isEmpty {
                                Text("No cards available")
                                    .foregroundColor(.gray)
                                    .padding()
                            
                            Text("Add Custom Flashcard")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                            } else {
                                Text("Add More Flashcards")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        }
                        
                    }
            }
            
            ZStack {
                ForEach(Array(flashcards.enumerated()), id: \.element.id) { index, flashcard in
                    DraggableCardView(flashcards: $flashcards, flashcard: flashcard)
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
            flashcards = viewModel.termsDeck
        case .phrases:
            flashcards = viewModel.phrasesDeck
        case .custom:
            flashcards = viewModel.customDeck
        case .saved:
            flashcards = viewModel.savedDeck
        }
    }
}


#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
