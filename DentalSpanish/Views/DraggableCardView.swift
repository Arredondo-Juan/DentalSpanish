import SwiftUI
import AVFoundation

struct DraggableCardView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @Binding var flashcards: [Flashcard]
    var flashcard: Flashcard
    @State private var offset: CGSize = .zero
    @State private var showingDeleteConfirmation = false
    @State private var showingTerm = true // Tracks which side is visible

    var body: some View {
        VStack {
            VStack {
                if showingTerm {
                    Text(flashcard.term)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 180)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 5, y: 5))
                } else {
                    Text(flashcard.definition)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 180)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 5, y: 5))
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    PlaybackButton(text: flashcard.definition)
                                        .padding()
                                }
                            }
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(self.offset.width) > 100 {
                            if self.offset.width > 0 {
                                // Swipe right - dismiss
                                self.flashcards.removeAll { $0.id == self.flashcard.id }
                            } else {
                                // Swipe left - save card
                                viewModel.saveFlashcard(self.flashcard)
                                self.flashcards.removeAll { $0.id == self.flashcard.id }
                            }
                        }
                        self.offset = .zero
                    }
            )
            .onTapGesture {
                withAnimation {
                    showingTerm.toggle()
                }
            }
            .offset(y: -50) // Adjust this value to position the card correctly
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
    }
}

