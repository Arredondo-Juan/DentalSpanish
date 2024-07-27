//
//  AddCustomFlashcardView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

struct AddCustomFlashcardView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @State private var term: String = ""
    @State private var definition: String = ""

    var body: some View {
        VStack {
            TextField("Term", text: $term)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Definition", text: $definition)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: addFlashcard) {
                Text("Add Flashcard")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Add Custom Flashcard")
        .padding()
    }

    private func addFlashcard() {
        let newFlashcard = Flashcard(term: term, definition: definition)
        viewModel.addCustomFlashcard(newFlashcard)
        term = ""
        definition = ""
    }
}



#Preview {
    AddCustomFlashcardView()
}
