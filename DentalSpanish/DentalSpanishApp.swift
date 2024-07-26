//
//  DentalSpanishApp.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

@main
struct FlashcardApp: App {
    @StateObject private var viewModel = FlashcardViewModel() // Create the ViewModel instance here

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) // Provide the ViewModel as an EnvironmentObject
        }
    }
}
