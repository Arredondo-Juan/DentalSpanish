//
//  AddCustomFlashcardView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

struct AddCustomFlashcardView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel // Inject the EnvironmentObject here
    @State private var term = ""
    @State private var definition = ""

    var body: some View {
        Form {
            TextField("Term", text: $term)
            TextField("Definition", text: $definition)
            Button("Add Flashcard") {
                viewModel.addCustomFlashcard(term: term, definition: definition)
            }
        }
        .navigationTitle("Add Custom Flashcard")
    }
}


#Preview {
    AddCustomFlashcardView()
}
