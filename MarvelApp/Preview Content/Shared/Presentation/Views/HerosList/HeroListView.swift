//
//  HeroListView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI

struct HeroListView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button {
                appState.getHeros()
            } label: {
                Text("Click")
                    
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.white)
            }

        }
    }
}

#Preview {
    HeroListView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "es"))
        .environment(AppStateVM())
}
