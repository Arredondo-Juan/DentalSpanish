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
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 300, height: 180)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5, y: 5))
                    
            } else {
                Text(flashcard.definition)
                    .font(.title)
                    .padding()
                    .frame(width: 300, height: 180)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5, y: 5))
            }
        }
        .offset(x: offset.width, y: offset.height)
        .rotationEffect(.degrees(Double(offset.width / 10))) // Add rotation effect for realism
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    withAnimation {
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
                }
        )
        .onTapGesture {
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
