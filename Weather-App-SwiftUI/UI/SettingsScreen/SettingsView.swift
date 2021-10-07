//
//  SettingsView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsData
    @Environment(\.presentationMode) var presentationMode
    
    @State private var checkDummy = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    BackButton {
                        self.presentationMode.wrappedValue.dismiss()
                        CacheService().saveSettings(settings)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        LabeledCheckbox($settings.useCelsius, label: "Celsius") { isChecked in
                            self.settings.useCelsius = isChecked
                        }
                        
                        LabeledCheckbox($settings.useCelsius.opposite, label: "Fahrenheit") { isChecked in
                            self.settings.useCelsius = !isChecked
                        }
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    ImageCheckbox($settings.showHumidity, image: Image("humidity")) { isChecked in
                        self.settings.showHumidity = isChecked
                        print("Humidity tapped in SettingsVIew")
                    }
                    
                    Spacer()
                    
                    ImageCheckbox($settings.showPressure, image: Image("pressure")) { isChecked in
                        self.settings.showPressure = isChecked
                    }

                    Spacer()
                    
                    ImageCheckbox($settings.showWindSpeed, image: Image("wind")) { isChecked in
                        self.settings.showWindSpeed = isChecked
                    }

                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
