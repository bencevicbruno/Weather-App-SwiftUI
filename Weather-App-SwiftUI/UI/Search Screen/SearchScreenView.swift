//
//  SearchView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 9/28/21.
//

import SwiftUI

struct SearchScreenView: View {
    var onCityNameTapped: ((String) -> Void)?
    
    @State var searchedCities = [String]()
    @State var cachedCities = [String]()
    
    @State private var searchKey: String = ""
    @State private var showingCachedResults = true
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundView()
                
                VStack {
                    HStack {
                        BackButton {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        TextField("Insert here", text: $searchKey)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Image("search")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                print("Lets search")
                                searchName()
//                                self.onSearchButtonTapped?(searchKey)
//                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    .padding()
                    .padding(.horizontal)
                    
                    List {
                        ForEach(citiesToShow, id: \.self) { cityName in
                            Text(cityName)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    self.onCityNameTapped?(cityName)
                                    self.saveSearched(cityName)
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            }.navigationBarHidden(true)
        }
        .onAppear(perform: loadCache)
    }
    
    func saveSearched(_ cityName: String) {
        self.cachedCities.append(cityName)
        CacheService().savePreviousSearch(self.cachedCities)
    }
    
    func loadCache() {
        self.cachedCities = CacheService().loadPreviousSearch()
    }
    
    var citiesToShow: [String] {
        self.showingCachedResults ? cachedCities.reversed() : searchedCities
    }
    
    init(onCityNameTapped: ((String) -> Void)? = nil) {
        self.onCityNameTapped = onCityNameTapped
        
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .none
        UITableView.appearance().backgroundColor = .none
    }
    
    func searchName() {
        let service = GeonamesService()
        
        DispatchQueue.global(qos: .background).async {
            let cities = service.getListOfCities(prefixedWith: searchKey) { error, message in
                print("\(error): \(message ?? "No description")")
            }
            
            DispatchQueue.main.async {
                self.searchedCities = cities
                self.showingCachedResults = false
            }
        }
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
    }
}
