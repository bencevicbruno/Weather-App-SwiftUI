//
//  LabeledCheckbox.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct LabeledCheckbox: View {
    @Binding var isChecked: Bool
    let label: String
    var onTapped: CheckboxTappedCallback?
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Checkbox($isChecked, onTapped: onTapped)
            Text(label)
                .font(Font.system(size: 30))
        }
    }
    
    init(_ binding: Binding<Bool>, label: String, onTapped: CheckboxTappedCallback? = nil) {
        self._isChecked = binding
        self.label = label
        self.onTapped = onTapped
    }
}

struct LabeledCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        LabeledCheckbox(.constant(true), label: "Test", onTapped: nil)
    }
}
