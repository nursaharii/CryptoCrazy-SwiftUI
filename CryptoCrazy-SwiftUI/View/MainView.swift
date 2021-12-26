//
//  ContentView.swift
//  CryptoCrazy-SwiftUI
//
//  Created by Nurşah on 26.12.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    var body: some View {
        NavigationView {
            List (cryptoListViewModel.cryptoList,id: \.id) { crypto in
                VStack {
                    Text(crypto.currency).font(.title3).foregroundColor(.blue).frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price).font(.title2).frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }.navigationTitle("Crypto Crazy")
        }.onAppear {
            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

