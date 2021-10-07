//
//  NavigationButtonView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct NavigationButtonView<Content: View>: View {
    let imageName: String
    let destinationView: Content?
    let onTapped: EmptyCallback?
    
    var body: some View {
        if let destination = self.destinationView {
            NavigationLink(
                destination: destination,
                label: {
                    Image(imageName)
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                })
                .simultaneousGesture(TapGesture().onEnded {
                    self.onTapped?()
                })
        } else {
            Button {
                self.onTapped?()
            } label: {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
    
    init(image: String, destination: Content? = nil, onTapped: EmptyCallback? = nil) {
        self.imageName = image
        self.destinationView = destination
        self.onTapped = onTapped
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView<AnyView>(image: "settings")
        NavigationButtonView<AnyView>(image: "search")
    }
}
