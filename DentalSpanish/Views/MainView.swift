//
//  MainView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/26/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel

    var body: some View {
        TabView {
            TermsListView()
                .tabItem {
                    Label("Terms & Phrases", systemImage: "list.dash")
                }
            
            FlashcardDecksView()
                .tabItem {
                    Label("Study", systemImage: "star")
                }
        }
    }
}

#Preview {
    MainView()
}
