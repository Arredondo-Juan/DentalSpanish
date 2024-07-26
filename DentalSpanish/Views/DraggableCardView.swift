//
//  DraggableCardView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/26/24.
//

import SwiftUI

struct DraggableCardView: View {
    @State private var translation: CGSize = .zero
    @Binding var flashcards: [Flashcard]
    var flashcard: Flashcard
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Text(flashcard.definition)
                    .font(.subheadline)
                    .padding()
            } else {
                Text(flashcard.term)
                    .font(.headline)
                    .padding()
            }
        }
        .frame(width: 300, height: 180)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
        .offset(x: translation.width, y: translation.height)
        .rotationEffect(.degrees(Double(translation.width / 20)))
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    translation = value.translation
                }
                .onEnded { value in
                    if abs(value.translation.width) > 100 {
                        withAnimation {
                            removeCard()
                        }
                    } else {
                        withAnimation {
                            translation = .zero
                        }
                    }
                }
        )
    }

    private func removeCard() {
        flashcards.removeAll { $0.id == flashcard.id }
    }
}

