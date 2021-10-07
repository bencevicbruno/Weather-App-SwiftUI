//
//  ContentView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 9/27/21.
//

import SwiftUI


struct MainView: View {
    @State private var showingSettingsSheet = false
    var settings = CacheService().loadSettings()
    
    var body: some View {
        VStack {
            NavigationView {
                HomeView(showingSettingsSheet: $showingSettingsSheet)
                    .removeNavigationBar()
            }
            .sheet(isPresented: $showingSettingsSheet) {
                SettingsView()
            }
            .environmentObject(settings)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
