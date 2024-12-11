//
//  ContentView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    
    private let network: NetworkHerosProtocol
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
        Task {
            await network.fetchHeros()
        }
    }
    
    var body: some View {
        Text("Hola, Mundo!")
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "es"))
}
