//
//  HomeView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct HomeView: View {
    @State var data = WeatherData.test
    
    @EnvironmentObject var settings: SettingsData
    
    @Binding var showingSettingsSheet: Bool
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    BackgroundView()
                    
                    VStack {
                        HStack(alignment: .top) {
                            NavigationButtonView(image: "search",
                                                 destination: SearchScreenView { cityName in
                                                    self.fetchWeatherData(for: cityName)
                                                 }
                                                 .removeNavigationBar())
                                .padding(.all.subtracting(.trailing))
                            
                            NavigationButtonView<AnyView>(image: "settings") {
                                self.showingSettingsSheet = true
                                print("Settings Button tapped!")
                            }
                            .padding()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                CurrentWeatherViewInfo(weatherIcon: data.weatherIcon, currentTemperature: data.currentTemperature, useCelsius: settings.useCelsius)
                                
                                Text(data.location)
                                    .font(Font.system(size: 30))
                                    .fontWeight(.regular)
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 60) {
                            TemperatureInfoView(name: "min", value: data.minimalTemperature, useCelsius: settings.useCelsius)
                            
                            TemperatureInfoView(name: "max", value: data.maximalTemperature, useCelsius: settings.useCelsius)
                        }
                        
                        Spacer()
                        Spacer()
                        
                        HStack(spacing: 20) {
                            if settings.showHumidity {
                                OptionalWeatherInfoView(name: "Humidity", value: data.humidity, unit: "%")
                            }
                            
                            if settings.showPressure {
                                OptionalWeatherInfoView(name: "Pressure", value: data.pressure, unit: "hpa")
                            }
                            
                            if settings.showWindSpeed {
                                OptionalWeatherInfoView(name: "Wind", value: data.windSpeed, unit: "mph")
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func fetchWeatherData(for cityName: String) {
        let service = OpenWeatherAPIService()
        
        DispatchQueue.global(qos: .background).async {
            if let response = service.getWeatherData(for: cityName, errorNotifier: {
                print("\($0): \($1 ?? "Unknown error")")
            }) {
                DispatchQueue.main.async {
                    self.data = WeatherData(response: response)
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showingSettingsSheet: .constant(false))
            .environmentObject(SettingsData.test)
    }
}
