//
//  ImageCheckbox.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct ImageCheckbox: View {
    @Binding var isChecked: Bool
    let image: Image
    var onTapped: CheckboxTappedCallback?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            image
                .resizable()
                .frame(width: 70, height: 70)
            
            Checkbox($isChecked, onTapped: self.onTapped)
        }
    }
    
    init(_ binding: Binding<Bool>, image: Image, onTapped: CheckboxTappedCallback? = nil) {
        self._isChecked = binding
        self.image = image
        self.onTapped = onTapped
    }
}

struct ImageCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        ImageCheckbox(.constant(true), image: Image(systemName: "pencil"), onTapped: nil)
    }
}
