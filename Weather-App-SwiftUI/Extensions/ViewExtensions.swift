//
//  ViewExtensions.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

extension View {
    func removeNavigationBar() -> some View {
        return self
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
