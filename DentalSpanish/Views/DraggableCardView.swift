import SwiftUI

struct DraggableCardView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @Binding var flashcards: [Flashcard]
    var flashcard: Flashcard
    @State private var offset: CGSize = .zero
    @State private var showingDeleteConfirmation = false
    @State private var showingTerm = true // Tracks which side is visible

    var body: some View {
        VStack {
            if showingTerm {
                Text(flashcard.term)
                    .font(.headline)
                    .padding()
            } else {
                Text(flashcard.definition)
                    .font(.subheadline)
                    .padding()
            }
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .offset(offset)
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
            // Toggle between term and definition
            withAnimation {
                showingTerm.toggle()
            }
        }
        .contextMenu {
            Button(action: {
                showingDeleteConfirmation = true
            }) {
                Label("Delete", systemImage: "trash")
            }
        }
        .alert(isPresented: $showingDeleteConfirmation) {
            Alert(
                title: Text("Delete Card"),
                message: Text("Are you sure you want to delete this flashcard?"),
                primaryButton: .destructive(Text("Delete")) {
                    self.flashcards.removeAll { $0.id == self.flashcard.id }
                },
                secondaryButton: .cancel()
            )
        }
    }
}
