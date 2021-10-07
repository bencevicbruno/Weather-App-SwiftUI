//
//  BackgroundView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        GeometryReader { geo in
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
