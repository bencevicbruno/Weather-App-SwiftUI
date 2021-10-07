//
//  BackButton.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct BackButton: View {
    var action: EmptyCallback?
    
    var body: some View {
        Image(systemName: "chevron.backward")
            .foregroundColor(.black)
            .frame(width: 40, height: 40)
            .contentShape(Rectangle())
            .onTapGesture {
                self.action?()
            }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(action: nil)
    }
}
