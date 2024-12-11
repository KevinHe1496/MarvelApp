//
//  SplashView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Image(.splashBackground)
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
