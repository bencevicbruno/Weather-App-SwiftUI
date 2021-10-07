//
//  Checkbox.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    var onTapped: CheckboxTappedCallback?
    
    var body: some View {
        ZStack {
            Color.white
            
            if isChecked {
                Image("check")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            isChecked.toggle()
            print("Checking")
            self.onTapped?(self.isChecked)
        }
    }
    
    init(_ binding: Binding<Bool>, onTapped: CheckboxTappedCallback? = nil) {
        self._isChecked = binding
        self.onTapped = onTapped
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(.constant(true), onTapped: nil)
    }
}
